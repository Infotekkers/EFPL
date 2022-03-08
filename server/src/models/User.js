const mongoose = require("mongoose");

const fantasyLeaguesSchema = mongoose.Schema({
  leagueId: Number,
  previousRank: Number,
});

const playerSchema = mongoose.Schema({
  playerId: Number,
  multiplier: Number,
  isCaptain: Boolean,
  isViceCaptain: Boolean,
});

const teamSchema = mongoose.Schema({
  gameweekId: Number,
  activeChip: String,
  deduction: Number,
  players: {
    type: Map,
    of: playerSchema,
  },
});

const userSchema = mongoose.Schema({
  userName: String,
  password: String,
  email: String,
  teamName: String,
  country: String,
  favouriteEplTeam: Number,
  availableChips: [String],
  fantasyLeagues: [fantasyLeaguesSchema],
  team: [teamSchema],
});

module.exports = mongoose.model("users", userSchema);
