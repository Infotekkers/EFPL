const mongoose = require("mongoose");

// Concern here - should we maybe add default values 0 maybe

const minutesSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfMinutes: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of minutes is required.",
    ],
  },
});
const goalsScoredSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfGoals: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of goals is required.",
    ],
  },
});
const assistsSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfSaves: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of saves is required.",
    ],
  },
});
const yellowsSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfYellows: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of yellow cards is required.",
    ],
  },
});
const redsSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfReds: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of red cards is required.",
    ],
  },
});
const penaltiesMissedSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfPenMissed: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of missed penalties is required.",
    ],
  },
});
const savesSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  noOfSaves: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Number of saves is required.",
    ],
  },
});
const fantasyScoresSchema = mongoose.Schema({
  playerId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Player ID is required."],
  },
  playerScores: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Player's fantasy score is required.",
    ],
  },
});
const statSchema = mongoose.Schema({
  fixtureId: {
    type: Number,
    required: [true, "Custom Error - Required Value *:Fixture ID is required."],
  },
  minutesPlayed: [minutesSchema],
  goalsScored: [goalsScoredSchema],
  assists: [assistsSchema],
  yellows: [yellowsSchema],
  reds: [redsSchema],
  penaltiesMissed: [penaltiesMissedSchema],
  saves: [savesSchema],
  fantasyScores: [fantasyScoresSchema],
});
module.exports = mongoose.model("stats", statSchema);
