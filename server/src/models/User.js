const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const { isEmail, isStrongPassword } = require("validator");

const fantasyLeaguesSchema = mongoose.Schema({
  leagueId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:League ID is required."],
  },
  previousRank: Number,
});

const playerSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  multiplier: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Multiplayer status is required.",
    ],
  },
  eplTeamId: {
    type: String,
    required: [
      true,
      "Custom Error - Required Value *:EPL team ID is required.",
    ],
  },
  price: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Price is required."],
  },
  isCaptain: { type: Boolean, default: false },
  isViceCaptain: { type: Boolean, default: false },
});

const teamSchema = mongoose.Schema({
  gameweekId: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Game week ID is required.",
    ],
  },
  activeChip: { type: String, default: "" },
  freeTransfers: { type: Number, default: 1 },
  deduction: { type: Number, default: 0 },
  players: [],
});

const userSchema = mongoose.Schema({
  userName: {
    type: String,
    required: [true, "Custom Error - Required Value *:Username is required."],
  },
  password: {
    type: String,
    minlength: 8,
    required: true,

    // Concern here - is this a message
    validate: [
      isStrongPassword,
      "minimum 8 characters,1uppercase,1lowercase,symbol&number",
    ],
  },
  email: {
    type: String,

    // Concern Here - Should Email be required?
    required: [true, "Custom Error - Required Value *:Email is required."],
    validate: [isEmail, "input valid email"],
  },

  // Concern - here Shouldnt this be unique
  teamName: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team name is required."],
  },
  country: String,
  favouriteEplTeamId: { type: String, default: "" },
  maxBudget: { type: Number, default: 100.0 },
  availableChips: { type: [String], default: ["BB", "WC", "TC", "FH"] },
  fantasyLeagues: { type: [fantasyLeaguesSchema], default: [] },
  team: [teamSchema],
});

userSchema.pre("save", async function (next) {
  const salt = await bcrypt.genSalt();
  this.password = await bcrypt.hash(this.password, salt);
});

module.exports = mongoose.model("users", userSchema);
