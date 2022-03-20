const mongoose = require("mongoose");
const autoIncrement = require('mongoose-auto-increment');

var connection = mongoose.createConnection("mongodb://localhost:27017/FPLDB");
autoIncrement.initialize(connection);

const availabilitySchema = mongoose.Schema({
  injuryStatus: String,
  injuryMessage: { type: String, default: "" },
});

const scoreSchema = mongoose.Schema({
  gameweekId:{type:Number, required:true},
  price: {type:Number, required:true},
  fantasyScore: {type:Number, required:true},
  minutesPlayed:{type:Number, required:true},
  goal:{type:Number, required:true},
  assists:{type:Number, required:true},
  cleanSheet: {type:Number, required:true},
  yellows: {type:Number, required:true},
  reds: {type:Number, required:true},
  penalitiesMissed:{type:Number, required:true},
  penalitiesSaved: {type:Number, required:true},
  saves: {type:Number, required:true},
  ownGoal: {type:Number, required:true},
  transfersIn: {type:Number, required:true},
  transfersOut:{type:Number, required:true},
  form: {type:Number, required:true},
});

const historySchema = mongoose.Schema({
  startingPrice: {type:Number, required:true},
  endingPrice: {type:Number, required:true},
  totalFanstasyScore:{type:Number, required:true},
  totalMinutesScore: {type:Number, required:true},
  totalGoals: {type:Number, required:true},
  totalAssists: {type:Number, required:true},
  totalCleanSheets: {type:Number, required:true},
  totalYellows:{type:Number, required:true},
  totalReds: {type:Number, required:true},
  totalPenalitiesMissed:{type:Number, required:true},
  totalPenalitiesSaved:{type:Number, required:true},
  totalSaves:{type:Number, required:true},
  totalOwnGoal: {type:Number, required:true},
  totalTransfersIn:{type:Number, required:true},
  totalTransfersOut: {type:Number, required:true},
  totalForm: {type:Number, required:true},
});

const playerSchema = mongoose.Schema({
  playerName: {type:String, required:true, unique},
  eplTeamId: {type:String, required:true},
  currentPrice:{type:Number, required:true},
  position: {type:String, required:true},
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
