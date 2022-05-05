const mongoose = require("mongoose");

const customLeagueSchema = mongoose.Schema({
  leagueId: { type: Number, unique: true },
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

// Increment league Id middleware
customLeagueSchema.pre("save", async function (next) {
  if (this.leagueId) next();

  const previousDocument = await CustomLeagueModel.find({})
    .sort({ _id: -1 })
    .limit(1);

  if (previousDocument.length) {
    this.leagueId = previousDocument[0].leagueId + 1;
  } else {
    this.leagueId = 1000001;
  }
});

// Generate random leagueCode middleware
customLeagueSchema.pre("save", async function (next) {
  // Don't generate on update
  if (this.leagueCode) {
    next();
  }

  function generateLeagueCode() {
    return Math.random().toString(36).substring(2).toUpperCase();
  }

  async function validateLeagueCode(leagueCodeQuery) {
    return await CustomLeagueModel.exists({
      leagueCode: leagueCodeQuery,
    });
  }

  async function assignLeagueCode() {
    const leagueCode = generateLeagueCode();
    const leagueCodeAfterValidation = await validateLeagueCode(leagueCode);

    if (!leagueCodeAfterValidation) {
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
