const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

autoIncrement.initialize(mongoose.connection);

const teamPosition = mongoose.Schema({
  teamPoint: {
    type: Number,
    default: 0,
  },
  won: {
    type: Number,
    default: 0,
  },
  lost: {
    type: Number,
    default: 0,
  },
  Draw: {
    type: Number,
    default: 0,
  },
  goalsFor: {
    type: Number,
    default: 0,
  },
  goalsAgainst: {
    type: Number,
    default: 0,
  },
  goalDifferential: {
    type: Number,
    default: 0,
  },
});

const teamSchema = mongoose.Schema({
  teamName: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team name is required."],
  },
  teamCity: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team city is required."],
  },
  teamStadium: {
    type: String,
    required: [
      true,
      "Custom Error - Required Value *:Team stadium is required.",
    ],
  },
  teamLogo: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team logo is required."],
  },
  stadiumCapacity: {
    type: Number,
  },
  foundedIn: {
    type: Number,
  },
  teamCoach: {
    type: String,
  },
  teamPosition: {
    type: teamPosition,
  },
});

teamSchema.plugin(autoIncrement.plugin, {
  model: "teams",
  field: "teamId",
  startAt: 1,
  incrementBy: 1,
});

module.exports = mongoose.model("teams", teamSchema);
