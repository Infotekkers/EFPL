const mongoose = require("mongoose");

// used within fixtureSchema below
const lineupSchema = mongoose.Schema({
  teamId: { type: Number, required: true },
  lineup: {
    goalkeepers: { type: [Number], required: true },
    defenders: { type: [Number], required: true },
    midfielders: { type: [Number], required: true },
    strikers: { type: [Number], required: true },
    bench: { type: [Number], required: true },
  },
});

const fixtureSchema = mongoose.Schema({
  gameweekId: { type: Number, required: true },
  matchId: { type: String, required: true },
  schedule: { type: Date, required: true },
  status: { type: String, default: "scheduled" },
  homeTeam: { type: lineupSchema, required: true },
  awayTeam: { type: lineupSchema, required: true },
});

const Fixture = mongoose.model("fixtures", fixtureSchema);

module.exports = Fixture;
