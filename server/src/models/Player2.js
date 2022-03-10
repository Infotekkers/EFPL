const mongoose = require("mongoose");

const playerSchema = mongoose.Schema({});

module.exports = mongoose.model("players", playerSchema);
