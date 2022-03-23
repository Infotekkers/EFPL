const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

autoIncrement.initialize(mongoose.connection);

const teamSchema = mongoose.Schema({
  teamName: { type: String },
});

teamSchema.plugin(autoIncrement.plugin, { model: "teams", field: "teamId" });

teamSchema.plugin(autoIncrement.plugin, {
  model: "teams",
  field: "teamId",
  startAt: 1,
  incrementBy: 1,
});

module.exports = mongoose.model("teams", teamSchema);
