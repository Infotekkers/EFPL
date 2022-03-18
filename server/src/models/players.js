const mongoose = require("mongoose");

const availabilitySchema = mongoose.Schema({
  injuryStatus: String,
  injuryMessage: { type: String, default: "" },
});

const scoreSchema = mongoose.Schema({
  gameweekId: Number,
  price: Number,
  fantasyScore: Number,
  minutesPlayed: Number,
  goal: Number,
  assists: Number,
  cleanSheet: Number,
  yellows: Number,
  reds: Number,
  penalitiesMissed: Number,
  penalitiesSaved: Number,
  saves: Number,
  ownGoal: Number,
  transfersIn: Number,
  transfersOut: Number,
  form: Number,
});

const historySchema = mongoose.Schema({
  startingPrice: Number,
  endingPrice: Number,
  totalFanstasyScore: Number,
  totalMinutesScore: Number,
  totalGoals: Number,
  totalAssists: Number,
  totalCleanSheets: Number,
  totalYellows: Number,
  totalReds: Number,
  totalPenalitiesMissed: Number,
  totalPenalitiesSaved: Number,
  totalSaves: Number,
  totalOwnGoal: Number,
  totalTransfersIn: Number,
  totalTransfersOut: Number,
  totalForm: Number,
});

const playerSchema = mongoose.Schema({
  playerName: String,
  eplTeamId: String,
  currentPrice: Number,
  position: String,
  playerId: Number,

 availability: {type: [availabilitySchema]},
  score: {type: [scoreSchema]},
  history: {type: [historySchema]}
});

module.exports = mongoose.model("players", playerSchema);
