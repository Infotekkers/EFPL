const asyncHandler = require("express-async-handler");

const FixtureModel = require("../models/fixtures");

const postFixture = asyncHandler(async function (req, res) {
  const { gameweekId, schedule, status, homeTeam, awayTeam } = req.body;

  const matchId = `${homeTeam.teamId}v${awayTeam.teamId}`;

  const verifyMatch = await FixtureModel.find({ matchId: matchId });

  if (!verifyMatch.length) {
    await new FixtureModel({
      gameweekId,
      matchId,
      schedule,
      status,
      homeTeam,
      awayTeam,
    }).save();
    res.send("Fixture added!");
  } else {
    res.send("Fixture already exists in database");
  }
});

const startFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "scheduled") {
    match.status = "live";
    match
      .save()
      .then(() => res.send("Match is live."))
      .catch(() => res.status(500).send("Try again!"));
  }
});

const pauseFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "live") {
    match.status = "HT";
    match
      .save()
      .then(() => res.send("Half Time!"))
      .catch(() => res.status(500).send("Try again!"));
  }
});

const resumeFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "HT") {
    match.status = "live";
    match
      .save()
      .then(() => res.send("Match resumed."))
      .catch(() => res.status(500).send("Try again!"));
  }
});

const endFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "live") {
    match.status = "FT";
    match
      .save()
      .then(() => res.send("Full time!"))
      .catch(() => res.status(500).send("Try again!"));
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
  }
});

const updateFixture = asyncHandler(async function (req, res) {});

const getAllFixtures = asyncHandler(async function (req, res) {
  const matches = await FixtureModel.find();

  res.send(matches);
});

const getFixture = asyncHandler(async function (req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  res.send(match);
});

const deleteFixture = asyncHandler(async function (req, res) {
  await FixtureModel.deleteOne({ matchId: req.params.matchId });

  res.send("Match deleted from database.");
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
};
