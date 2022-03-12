const mongoose = require('mongoose');

// const saveSchema = mongoose.Schema({
//     playerId:{type:Number, required:true},
//     noOfSaves:{type:Number, required:true}
// })
// const fantasyScoresSchema = mongoose.Schema({
//     playerId:{type:Number, required:true},
//     playerScores:{type:Number, required:true}
// })
const statSchema = mongoose.Schema({
   fixtureId:{type:Number, required:true},
   minutesPlayed :{type:[Number], required:true},
   goalsScored :{type:[Number], required:true},
   assists :{type:[Number], required:true},
   yellows :{type:[Number], required:true},
   reds:{type:[Number],required:true},
   penaltiesMissed:{type:[Number], required:true},
   saves:{type:[Number], required:true},
   fantasyScores:{type:[Number], required:true}
   

})
module.exports = mongoose.model("stats", statSchema);