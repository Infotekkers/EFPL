const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const { isEmail, isStrongPassword } = require("validator");

const fantasyLeaguesSchema = mongoose.Schema({
  leagueId: { type: Number, required: true },
  previousRank: Number,
});

const playerSchema = mongoose.Schema({
  playerId: { type: Number, required: true },
  multiplier: { type: Number, required: true },
  isCaptain: { type: Boolean, default: false },
  isViceCaptain: { type: Boolean, default: false },
});

const teamSchema = mongoose.Schema({
  gameweekId: { type: Number, required: true },
  activeChip: { type: String, default: "" },
  deduction: { type: Number, default: 0 },
  players: {
    type: Map,
    of: playerSchema,
  },
});

const userSchema = mongoose.Schema({
  userName: { type: String, required: true },
  password: { type: String,minlength:8, required: true,validate:[isStrongPassword, "minimum 8 characters,1uppercase,1lowercase,symbol&number"] },
  email: { type: String, required: true, validate:[isEmail,"input valid email"]},
  teamName: { type: String, required: true },
  country: String,
  
});
userSchema.pre("save", async function(next){
  const salt = await bcrypt.genSalt();
  this.password = await bcrypt.hash(this.password, salt)
})

module.exports = mongoose.model("users", userSchema);
