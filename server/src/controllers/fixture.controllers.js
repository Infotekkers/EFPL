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

module.exports = { postFixture };
