const mongoose = require("mongoose");
const autoIncrement = require('mongoose-auto-increment');

var connection = mongoose.createConnection("mongodb://localhost:27017/FPLDB");
autoIncrement.initialize(connection);

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
  

 availability: {type: [availabilitySchema]},
  score: {type: [scoreSchema]},
  history: {type: [historySchema]}
}); 

var player = connection.model('player', playerSchema);

playerSchema.plugin(autoIncrement.plugin, 
        { model: 'player', 
          field:'playerId', 
          startAt:100000, 
          incrmentBy: 1
        });

module.exports = mongoose.model("players", playerSchema);
