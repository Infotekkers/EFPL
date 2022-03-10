const mongoose = require("mongoose");

// used within fixtureSchema below
const playersSchema = mongoose.Schema({
  playerId: { type: Number, required: true },
  playerName: { type: String, required: true },
  eplTeamId: { type: String, required: true },
  position: { type: String, required: true },
  currentPrice: { type: Number, required: true },
  availability: { type: [avaliablitySchema], required: true },
  history: [yearSchema],
});

const avaliablitySchema = mongoose.Schema({
  injuryStatus: Boolean,
  injuryMessage: { type: String, required: true },
})

const scoreSchema = mongoose.Schema({
  gameweekId: { type: Number, required: true },
  price: { type: Number, required: true },
  fantsasyScore: { type: Number, required: true }, 
  minutesPlayed: { type: Number, required: true },
  goal: { type: Number, required: true },
  assist: { type: Number, required: true },
  cleanSheet: { type: Number, required: true },
  yellows: { type: Number, required: true },
  reds: { type: Number, required: true },
  penalitiesMissed: { type: Number, required: true },
  penalitiesSaved: { type: Number, required: true },
  saves: { type: Number, required: true },
  ownGoal: { type: Number, required: true },
  transfersIn: { type: Number, required: true },
  transfersOut: { type: Number, required: true },
  form: { type: Number, required: true },
})

const history = mongoose.Schema({
  years: {
    type: Map,
    of: yearSchema,
  },
}) 

const yearSchema = mongoose.Schema({
  startingPrice: { type: Number, required: true },
  endingPrice: { type: Number, required: true },
  totalFantasyScore: { type: Number, required: true },
  totalMinutesPlayed: { type: Number, required: true },
  totalGoals: { type: Number, required: true },
  totalAssists: { type: Number, required: true },
  totalCleanSheets: { type: Number, required: true },
  totalYellows: { type: Number, required: true },
  totalReds: { type: Number, required: true },
  totalPenalitiesMissed: { type: Number, required: true },
  totalPenalitiesSaved: { type: Number, required: true },
  totalSaves: { type: Number, required: true },
  totalOwnGoal: { type: Number, required: true },
  totalTransfersIn: { type: Number, required: true },
  totalTransfersOut: { type: Number, required: true },
  totalform: { type: Number, required: true },
});

module.exports = mongoose.model("players", playersSchema);