const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

const customLeagueSchema = mongoose.Schema({
  leagueId: { type: Number, required: true },
  leagueName: { type: String, required: true },
  leagueCode: { type: String, required: true, unique: true },
  teams: { type: Array, required: true }, // Player team Ids
  adminId: { type: Number, required: true },
  leagueStartGameWeek: { type: Number, required: true },
});

customLeagueSchema.plugin(autoIncrement.plugin, {
  model: "Custom Leagues",
  field: "leagueId",
  startAt: 100001,
  incrementBy: 1,
});

// Generate random leagueCode
customLeagueSchema.pre("save", () => {
  function generateLeagueCode() {
    return validateGeneratedLeagueCode(
      Math.random().toString(36).substring(2).toUpperCase()
    );
  }

  function validateGeneratedLeagueCode(generatedLeagueCode) {
    if (!customLeagueSchema.find({ leagueCode: generatedLeagueCode }))
      return generateLeagueCode;

    generateLeagueCode();
  }

  function getValidatedLeagueCode() {
    return generateLeagueCode();
  }

  this.leagueCode = getValidatedLeagueCode();
});

module.exports = mongoose.model("Custom Leagues", customLeagueSchema);
