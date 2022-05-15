const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

autoIncrement.initialize(mongoose.connection);
const teamPosition = mongoose.Schema({
  teamPoint: {
    type: Number,
  },
  won: {
    type: Number,
  },
  lost: {
    type: Number,
  },
  Draw: {
    type: Number,
  },
  goalDifferntial: {},
  goalAgainst: {},
  goalFor: {},
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
  teamPosition: { type: [teamPosition], default: [] },
});

teamSchema.plugin(autoIncrement.plugin, {
  model: "teams",
  field: "teamId",
  startAt: 1,
  incrementBy: 1,
});

module.exports = mongoose.model("teams", teamSchema);
