const mongoose = require("mongoose");

const gameweekSchema = mongoose.Schema({
  number: Number,
  deadlineTimestamp: String,
  status: String,
});

module.exports = mongoose.model("gws", gameweekSchema);
