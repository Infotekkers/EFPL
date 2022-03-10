const mongoose = require("mongoose");

const fantasyLeaguesSchema = mongoose.Schema({
  leagueId: { type: Number, required: true },
  previousRank: Number,
});

const playerSchema = mongoose.Schema({
  playerId: { type: Number, required: true },
  multiplier: { type: Number, required: true },
  eplTeamId: { type: String, required: true },
  price: { type: Number, required: true },
  isCaptain: { type: Boolean, default: false },
  isViceCaptain: { type: Boolean, default: false },
});

const teamSchema = mongoose.Schema({
  gameweekId: { type: Number, required: true },
  activeChip: { type: String, default: "" },
  freeTransfers: { type: Number, default: 1 },
  deduction: { type: Number, default: 0 },
  players: {
    type: Map,
    of: playerSchema,
  },
});

const userSchema = mongoose.Schema({
  userName: { type: String, required: true },
  password: { type: String, required: true },
  email: { type: String, required: true },
  teamName: { type: String, required: true },
  country: String,
  favouriteEplTeamId: { type: String, default: "" },
  availableChips: { type: [String], default: ["BB", "WC", "TC", "FH"] },
  fantasyLeagues: { type: [fantasyLeaguesSchema], default: [] },
  team: [teamSchema],
});

module.exports = mongoose.model("users", userSchema);
