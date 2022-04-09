const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

autoIncrement.initialize(mongoose.connection);

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
});

teamSchema.plugin(autoIncrement.plugin, { model: "teams", field: "teamId" });

teamSchema.plugin(autoIncrement.plugin, {
  model: "teams",
  field: "teamId",
  startAt: 2,
  incrementBy: 1,
});

module.exports = mongoose.model("teams", teamSchema);
