const mongoose = require("mongoose");

const customLeagueSchema = mongoose.Schema({
  // leagueId: { type: Number, required: true },
  leagueType: {
    type: String,
    required: true,
    default: "Public",
    enum: {
      values: ["Public", "Private"],
    },
  },
  leagueName: { type: String, required: true },
  leagueCode: { type: String, unique: true },
  teams: { type: Array, required: true }, // Player team Ids
  adminId: { type: Number, required: true },
  leagueStartGameWeek: { type: Number, required: true },
});

// Generate random leagueCode
customLeagueSchema.pre("save", async function (next) {
  function generateLeagueCode() {
    return Math.random().toString(36).substring(2).toUpperCase();
  }

  async function validateLeagueCode(leagueCodeQuery) {
    return await CustomLeagueModel.exists({ leagueCode: leagueCodeQuery });
  }

  async function assignLeagueCode() {
    const leagueCode = generateLeagueCode();

    if (validateLeagueCode(leagueCode)) {
      return leagueCode;
    } else {
      return assignLeagueCode();
    }
  }

  this.leagueCode = await assignLeagueCode();
  next();
});

const CustomLeagueModel = mongoose.model("Custom Leagues", customLeagueSchema);
module.exports = CustomLeagueModel;
