const mongoose = require("mongoose");

const minutesSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfMinutes: {
    type: Number,
    default: 0,
  },
});
const goalsScoredSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfGoals: {
    type: Number,
    default: 0,
  },
});
const assistsSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfAssists: {
    type: Number,
    default: 0,
  },
});
const cleanSheetSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfCleanSheets: {
    type: Number,
    default: 0,
  },
});
const yellowsSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfYellows: {
    type: Number,
    default: 0,
  },
});
const redsSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfReds: {
    type: Number,
    default: 0,
  },
});
const penaltiesMissedSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfPenMissed: {
    type: Number,
    default: 0,
  },
});
const penaltiesSavedSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfPenSaved: {
    type: Number,
    default: 0,
  },
});
const savesSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfSaves: {
    type: Number,
    default: 0,
  },
});
const ownGoalSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  noOfOwnGoals: {
    type: Number,
    default: 0,
  },
});
const fantasyScoresSchema = mongoose.Schema({
  playerId: {
    type: Number,
  },
  playerScores: {
    type: Number,
    default: 0,
  },
});

const matchStatSchema = mongoose.Schema({
  minutesPlayed: { type: Map, of: minutesSchema },
  goalsScored: { type: Map, of: goalsScoredSchema },
  assists: { type: Map, of: assistsSchema },
  cleanSheet: { type: Map, of: cleanSheetSchema },
  yellows: { type: Map, of: yellowsSchema },
  reds: { type: Map, of: redsSchema },
  penaltiesMissed: { type: Map, of: penaltiesMissedSchema },
  penaltiesSaved: { type: Map, of: penaltiesSavedSchema },
  saves: { type: Map, of: savesSchema },
  ownGoal: { type: Map, of: ownGoalSchema },
  fantasyScores: { type: Map, of: fantasyScoresSchema },
});

// used within fixtureSchema below
const lineupSchema = mongoose.Schema({
  teamId: { type: Number, required: true },
  lineup: {
    goalkeepers: {
      type: [Number],
      required: [
        true,
        "Custom Error - Required Value *:Goalkeeper is required in lineup.",
      ],
    },
    defenders: {
      type: [Number],
      required: [
        true,
        "Custom Error - Required Value *Defenders are required in lineup.",
      ],
    },
    midfielders: {
      type: [Number],
      required: [
        true,
        "Custom Error - Required Value *:Midfielders are required in lineup.",
      ],
    },
    strikers: {
      type: [Number],
      required: [
        true,
        "Custom Error - Required Value *:Strikers are required in lineup.",
      ],
    },
    bench: {
      type: [Number],
      required: [
        true,
        "Custom Error - Required Value *:Bench Players are required in lineup.",
      ],
    },
  },
});

const fixtureSchema = mongoose.Schema({
  gameweekId: {
    type: Number,
    index: true,
    required: [
      true,
      "Custom Error - Required Value *:Game week ID is required.",
    ],
  },
  matchId: {
    type: String,
    required: [true, "Custom Error - Required Value *:Match ID is required."],
  },
  fdr: {
    type: Number,
    required: [true, "Custom Error - Required Value *:FDR is required."],
    default: 0,
  },
  schedule: {
    type: Date,
    index: true,
    required: [
      true,
      "Custom Error - Required Value *:Fixture Schedule ID is required.",
    ],
  },
  // Concern Here what are the possible values
  status: { type: String, default: "scheduled", index: true },
  homeTeam: {
    type: String,
    index: true,
    required: [
      true,
      "Custom Error - Required Value *:Home Team is required for a fixture.",
    ],
  },
  awayTeam: {
    type: String,
    index: true,
    required: [
      true,
      "Custom Error - Required Value *:Away Team is required for a fixture.",
    ],
  },
  homeTeamLineUp: {
    type: lineupSchema,
  },
  awayTeamLineUp: {
    type: lineupSchema,
  },
  matchStat: matchStatSchema,
  score: { type: String, default: "0v0" },
});

const Fixture = mongoose.model("fixtures", fixtureSchema);

module.exports = Fixture;
