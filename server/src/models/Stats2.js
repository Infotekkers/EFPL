const mongoose = require('mongoose');

const minutesSchema = mongoose.Schema({
    playerId:{type:Number, required:true},
    noOfMinutes:{type:Number, required:true}
})
const goalsScoredSchema = mongoose.Schema({
    playerId:{type:Number, required:true},
    noOfGoals:{type:Number, required:true}
})
const assistsSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   noOfSaves:{type:Number, required:true}
})
const yellowsSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   noOfYellows:{type:Number, required:true}
})
const redsSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   noOfReds:{type:Number, required:true}
})
const penaltiesMissedSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   noOfPenMissed:{type:Number, required:true}
})
const savesSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   noOfSaves:{type:Number, required:true}
})
const fantasyScoresSchema = mongoose.Schema({
   playerId:{type:Number, required:true},
   playerScores:{type:Number, required:true}
})
const statSchema = mongoose.Schema({
   fixtureId:{type:Number, required:true},
   minutesPlayed :[minutesSchema],
   goalsScored :[goalsScoredSchema],
   assists :[assistsSchema],
   yellows :[yellowsSchema],
   reds:[redsSchema],
   penaltiesMissed:[penaltiesMissedSchema],
   saves:[savesSchema],
   fantasyScores:[fantasyScoresSchema]
})
module.exports = mongoose.model("stats", statSchema);