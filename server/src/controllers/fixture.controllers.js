const asyncHandler = require("express-async-handler");
const statUpdater = require("../utils/helpers").statUpdater;

const FixtureModel = require("../models/Fixtures");
const TeamModel = require("../models/Teams");

const MINUTE_COUNTERS = {};

const postFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, homeTeam, awayTeam } = req.body;

  // query team for id
  const homeTeamData = await TeamModel.findOne({ teamName: homeTeam });
  const awayTeamData = await TeamModel.findOne({ teamName: awayTeam });
  const matchId = `${homeTeamData.teamId}|${awayTeamData.teamId}`;
  const matchStat = {
    minutesPlayed: {},
    goalsScored: {},
    assists: {},
    yellows: {},
    reds: {},
    penaltiesMissed: {},
    penaltiesSaved: {},
    saves: {},
    fantasyScores: {},
  };

  const verifyMatch = await FixtureModel.find({ matchId: matchId });

  if (!verifyMatch.length) {
    await new FixtureModel({
      gameweekId,
      matchId,
      schedule,
      homeTeam,
      awayTeam,
      matchStat,
    }).save();
    res.send("Fixture added!");
  } else {
    res.send("Fixture already exists in database");
  }
});

const startFixture = asyncHandler(async function (req, res) {
  const matchId = req.params.matchId;

  const matchParent = await FixtureModel.findOne({ matchId });

  if (matchParent?.status === "scheduled") {
    matchParent.status = "liveFH"; // First half

    // Minutes Counter Id saved so it can be cleared when the match is done
    MINUTE_COUNTERS[matchId] = { status: "active" };
    MINUTE_COUNTERS[matchId].intervalId = setInterval(async () => {
      if (MINUTE_COUNTERS[matchId].status === "active") {
        console.log("MINUTE COUNTER ->");
        const match = await FixtureModel.findOne({ matchId }).lean();

        const update = { minutesPlayed: {} };

        for (const position in match.homeTeamLineUp.lineup) {
          if (position === "bench") continue;
          for (const playerId of match.homeTeamLineUp.lineup[position]) {
            update.minutesPlayed[playerId] = {
              playerId,
              noOfMinutes:
                match.matchStat.minutesPlayed[playerId].noOfMinutes + 1,
            };
          }
        }

        for (const position in match.awayTeamLineUp.lineup) {
          if (position === "bench") continue;
          for (const playerId of match.awayTeamLineUp.lineup[position]) {
            update.minutesPlayed[playerId] = {
              playerId,
              noOfMinutes:
                match.matchStat.minutesPlayed[playerId].noOfMinutes + 1,
            };
          }
        }

        const result = statUpdater({
          activeMatch: match,
          incomingUpdate: update,
        });

        await FixtureModel.findOneAndUpdate({ matchId }, result, {
          upsert: false,
        });
      }
    }, 1000);

    matchParent
      .save()
      .then(() => res.status(200).send("Match is live!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!matchParent) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match can't be started!");
  }
});

const pauseFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "liveFH") {
    match.status = "HT";

    MINUTE_COUNTERS[req.params.matchId].status = "paused";

    match
      .save()
      .then(() => res.send("Half Time!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match hasn't started!");
  }
});

const resumeFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  MINUTE_COUNTERS[req.params.matchId].status = "active";

  if (match?.status === "HT") {
    match.status = "liveSH"; // Second half
    match
      .save()
      .then(() => res.send("Match resumed!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match can't be resumed!");
  }
});

const endFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "liveSH") {
    match.status = "FT";

    MINUTE_COUNTERS[req.params.matchId].status = "ended";
    clearInterval(MINUTE_COUNTERS[req.params.matchId].intervalId);

    match
      .save()
      .then(() => res.send("Full time!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match can't be ended!");
  }
});

const postponeFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "scheduled") {
    match.status = "postponed";
    match
      .save()
      .then(() => res.send("Match postponed!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match is ongoing!");
  }
});

const updateFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, status, homeTeam, awayTeam } = req.body;

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId });

  if (match) {
    match.gameweekId = gameweekId ?? match.gameweekId;
    match.matchId = matchId ?? match.matchId;
    match.schedule = schedule ?? match.schedule;
    match.status = status ?? match.status;
    match.homeTeam = homeTeam ?? match.homeTeam;
    match.awayTeam = awayTeam ?? match.awayTeam;
    await match.save();

    res.send("Match updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const updateLineup = asyncHandler(async (req, res) => {
  const { homeTeamLineUp, awayTeamLineUp } = req.body;

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId });

  if (match) {
    match.homeTeamLineUp = homeTeamLineUp ?? match.homeTeamLineUp;
    match.awayTeamLineUp = awayTeamLineUp ?? match.awayTeamLineUp;
    await match.save();

    res.send("Match lineup updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const updateStats = asyncHandler(async (req, res) => {
  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId }).lean();

  if (match) {
    const result = statUpdater({
      activeMatch: match,
      incomingUpdate: req.body,
    });

    await FixtureModel.findOneAndUpdate({ matchId }, result, { upsert: false });

    res.send("Match stats updated!");
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match with provided matchid doesn't exist.");
  }
});

const getAllFixtures = asyncHandler(async function (req, res) {
  const matches = await FixtureModel.find();

  res.send(matches);
});

const getFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  match
    ? res.send(match)
    : res.status(400).send("Fixture with provided matchid doesn't exist.");
});

const deleteFixture = asyncHandler(async function (req, res) {
  await FixtureModel.deleteOne({ matchId: req.params.matchId }).then(() => {
    return res.send("Match deleted from database.");
  });

  res.status(400).send("Match with provided matchid doesn't exist");
});

module.exports = {
  postFixture,
  startFixture,
  pauseFixture,
  resumeFixture,
  endFixture,
  postponeFixture,
  getAllFixtures,
  getFixture,
  deleteFixture,
  updateFixture,
  updateLineup,
  updateStats,
};
