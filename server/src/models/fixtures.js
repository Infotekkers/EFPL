const mongoose = require("mongoose");

// used within fixtureSchema below
const fixtureTeamSchema = mongoose.Schema({
  lineup: {
    goalkeepers: {type: [Number], required: true},
    defenders: {type: [Number], required: true},
    midfielders: {type: [Number], required: true},
    strikers: {type: [Number], required: true},
    bench: {type: [Number], required: true},
  }
})

const fixtureSchema = mongoose.Schema({
  gameweekId: {type: String, required: true},
  schedule: {type: Date, required: true},
  status: {type: String, default: "s"}, // s for scheduled
  homeTeam: fixtureTeamSchema,
  awayTeam: fixtureTeamSchema,
})

const Fixture = mongoose.model("fixtures", fixtureSchema);

module.exports = Fixture;

