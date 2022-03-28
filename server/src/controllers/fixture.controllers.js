const asyncHandler = require("express-async-handler");

const FixtureModel = require("../models/Fixtures");
const TeamModel = require("../models/Teams");

// const MINUTE_COUNTERS = {};

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
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  // if (match?.status === "scheduled") {
  match.status = "liveFH"; // First half

  // Minutes Counter Id saved so it can be cleared when the match is done
  // MINUTE_COUNTERS[req.params.matchId] = setInterval(async () => {
  //   console.log("Metch Counter HUH-))");
  //   const [{ homeTeamLineUp, awayTeamLineUp }] = await FixtureModel.aggregate([
  //     {
  //       $match: { matchId: req.params.matchId },
  //     },
  //   ]);

  //   for (const position of homeTeamLineUp.lineup) {
  //     console.log(position);
  //   }
  // }, 1000);

  match
    .save()
    .then(() => res.status(200).send("Match is live!"))
    .catch(() => res.status(500).send("Try again!"));
  // if (!match) {
  //   res.status(404).send("Match doesn't exist!");
  // } else {
  //   res.status(400).send("Match can't be started!");
  // }
});

const pauseFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "liveFH") {
    match.status = "HT";
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
  const {
    minutesPlayed,
    goalsScored,
    assists,
    yellows,
    reds,
    penaltiesMissed,
    penaltiesSaved,
    saves,
    fantasyScores,
  } = req.body;

  const matchId = req.params.matchId;

  const match = await FixtureModel.findOne({ matchId }).lean();

  if (match) {
    for (const position in match.homeTeamLineUp.lineup) {
      if (position === "on") break;
      for (const playerId of match.homeTeamLineUp.lineup[position]) {
        match.matchStat.minutesPlayed[playerId] =
          minutesPlayed && playerId in minutesPlayed
            ? minutesPlayed[playerId]
            : null ?? match.matchStat.minutesPlayed[playerId] ?? {};

        match.matchStat.goalsScored[playerId] =
          goalsScored && playerId in goalsScored
            ? goalsScored[playerId]
            : null ?? match.matchStat.goalsScored[playerId] ?? {};

        match.matchStat.assists[playerId] =
          assists && playerId in assists
            ? assists[playerId]
            : null ?? match.matchStat.assists[playerId] ?? {};

        match.matchStat.yellows[playerId] =
          yellows && playerId in yellows
            ? yellows[playerId]
            : null ?? match.matchStat.yellows[playerId] ?? {};

        match.matchStat.reds[playerId] =
          reds && playerId in reds
            ? reds[playerId]
            : null ?? match.matchStat.reds[playerId] ?? {};

        match.matchStat.penaltiesMissed[playerId] =
          penaltiesMissed && playerId in penaltiesMissed
            ? penaltiesMissed[playerId]
            : null ?? match.matchStat.penaltiesMissed[playerId] ?? {};

        match.matchStat.penaltiesSaved[playerId] =
          penaltiesSaved && playerId in penaltiesSaved
            ? penaltiesSaved[playerId]
            : null ?? match.matchStat.penaltiesSaved[playerId] ?? {};

        match.matchStat.saves[playerId] =
          saves && playerId in saves
            ? saves[playerId]
            : null ?? match.matchStat.saves[playerId] ?? {};

        match.matchStat.fantasyScores[playerId] =
          fantasyScores && playerId in fantasyScores
            ? fantasyScores[playerId]
            : null ?? match.matchStat.fantasyScores[playerId] ?? {};

        console.log(minutesPlayed[playerId], playerId);
      }
    }
    await FixtureModel.findOneAndUpdate({ matchId }, match, { upsert: false });

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
