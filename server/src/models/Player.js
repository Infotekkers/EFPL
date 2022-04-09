const mongoose = require("mongoose");
const autoIncrement = require("mongoose-auto-increment");

autoIncrement.initialize(mongoose.connection);

const availabilitySchema = mongoose.Schema({
  injuryStatus: String,
  injuryMessage: { type: String, default: "" },
});

const scoreSchema = mongoose.Schema({
  gameweekId: { type: Number },
  price: { type: Number },
  fantasyScore: { type: Number },
  minutesPlayed: { type: Number },
  goals: { type: Number },
  assists: { type: Number },
  cleanSheet: { type: Number },
  yellows: { type: Number },
  reds: { type: Number },
  penalitiesMissed: { type: Number },
  penalitiesSaved: { type: Number },
  saves: { type: Number },
  ownGoal: { type: Number },
  transfersIn: { type: Number },
  transfersOut: { type: Number },
  form: { type: Number },
});

const historySchema = mongoose.Schema({
  startingPrice: { type: Number },
  endingPrice: { type: Number },
  totalFanstasyScore: { type: Number },
  totalMinutesScore: { type: Number },
  totalGoals: { type: Number },
  totalAssists: { type: Number },
  totalCleanSheets: { type: Number },
  totalYellows: { type: Number },
  totalReds: { type: Number },
  totalPenalitiesMissed: { type: Number },
  totalPenalitiesSaved: { type: Number },
  totalSaves: { type: Number },
  totalOwnGoal: { type: Number },
  totalTransfersIn: { type: Number },
  totalTransfersOut: { type: Number },
  totalForm: { type: Number },
});

const playerSchema = mongoose.Schema({
  playerName: { type: String },
  eplTeamId: { type: String },
  currentPrice: { type: Number },
  position: { type: String },
  availability: { type: [availabilitySchema] },
  score: { type: [scoreSchema] },
  history: { type: [historySchema] },
});

playerSchema.plugin(autoIncrement.plugin, {
  model: "players",
  field: "playerId",
  startAt: 100000,
  incrementBy: 1,
});

module.exports = mongoose.model("players", playerSchema);
