const asyncHandler = require("express-async-handler");

const FixtureModel = require("../models/Fixtures");
const TeamModel = require("../models/Teams");

const postFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, homeTeam, awayTeam } = req.body;

  // query team for id
  const homeTeamData = await TeamModel.findOne({ teamName: homeTeam });
  const awayTeamData = await TeamModel.findOne({ teamName: awayTeam });
  const matchId = `${homeTeamData.teamId}|${awayTeamData.teamId}`;

  const verifyMatch = await FixtureModel.find({ matchId: matchId });

  const homeTeamHasMatch = await FixtureModel.find({
    gameweekId: gameweekId,
    homeTeam: homeTeam,
  });

  const awayTeamHasMatch = await FixtureModel.find({
    gameweekId: gameweekId,
    awayTeam: awayTeam,
  });

  console.log(homeTeamHasMatch, awayTeamHasMatch);

  // If home team already has match
  if (homeTeamHasMatch.length > 0) {
    res
      .status(409)
      .send(
        `Team ${homeTeam} already has a match for game week ${gameweekId}.`
      );
  } else if (awayTeamHasMatch.length > 0) {
    res
      .status(409)
      .send(
        `Team ${awayTeam} already has a match for game week ${gameweekId}.`
      );
  } else if (!verifyMatch.length) {
    await new FixtureModel({
      gameweekId,
      matchId,
      schedule,
      homeTeam,
      awayTeam,
    }).save();
    res.status(200).send("Fixture added!");
  } else {
    res
      .status(409)
      .send(
        `Fixture ${homeTeam} vs ${awayTeam} for game week ${gameweekId} already exists. `
      );
  }
});

const startFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "scheduled") {
    match.status = "liveFH"; // First half
    match
      .save()
      .then(() => res.send("Match is live!"))
      .catch(() => res.status(500).send("Try again!"));
  } else if (!match) {
    res.status(404).send("Match doesn't exist!");
  } else {
    res.status(400).send("Match can't be started!");
  }
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

  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match) {
    const matchId = `${homeTeam.teamId}|${awayTeam.teamId}`;

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

const getAllFixtures = asyncHandler(async function (req, res) {
  const matches = await FixtureModel.find().select("-__v");

  res.status(200).send(matches);
});

const getFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({
    matchId: req.params.matchId,
  }).select("-__v");

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
};
