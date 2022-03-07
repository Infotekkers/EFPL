const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  userName: String,
  password: String,
  email: String,
  teamName: String,
  country: String,
  favouriteEplTeam: Number,
  availableChips: [String],
  fantasyLeagues: [{ leagueId: Number, previousRank: Number }],
  team: [
    {
      gameweekId: Number,
      activeChip: String,
      players: [
        {
          playerId: Number,
          multiplier: Number,
          isCaptain: Boolean,
          isViceCaptain: Boolean,
        },
      ],
    },
  ],
});

module.exports = mongoose.model("users", userSchema);
