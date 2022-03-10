const FixtureModel = require("../models/fixtures");

async function postFixture(req, res) {
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
}

async function startFixture(req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "scheduled") {
    match.status = "live";
    match
      .save()
      .then(() => res.send("Match is live."))
      .catch(() => res.status(500).send("Try again!"));
  }
}

async function pauseFixture(req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "live") {
    match.status = "HT";
    match
      .save()
      .then(() => res.send("Match is live"))
      .catch(() => res.status(500).send("Try again!"));
  }
}

async function resumeFixture(req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "HT") {
    match.status = "live";
    match
      .save()
      .then(() => res.send("Match resumed."))
      .catch(() => res.status(500).send("Try again!"));
  }
}

async function endFixture(req, res) {
  const match = await FixtureModel.findOne({ matchId: req.params.matchId });

  if (match?.status === "live") {
    match.status = "FT";
    match
      .save()
      .then(() => res.send("Full time!"))
      .catch(() => res.status(500).send("Try again!"));
  }
}

module.exports = {
  postFixture,
  startFixture,
  pauseFixture,
  resumeFixture,
  endFixture,
};
