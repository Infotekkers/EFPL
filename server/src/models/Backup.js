const mongoose = require("mongoose");

const MONGO_LEGACY_DB_URI = process.env.MONGO_LOCAL_LEGACY_URL;

// Create Connection
const bkConnection = mongoose.createConnection(MONGO_LEGACY_DB_URI);

/*
=======================================
Teams
=======================================
*/
const teamPosition = mongoose.Schema({
  teamPoint: {
    type: Number,
    default: 0,
  },
  won: {
    type: Number,
    default: 0,
  },
  lost: {
    type: Number,
    default: 0,
  },
  Draw: {
    type: Number,
    default: 0,
  },
  goalsFor: {
    type: Number,
    default: 0,
  },
  goalsAgainst: {
    type: Number,
    default: 0,
  },
  goalDifferential: {
    type: Number,
    default: 0,
  },
});

const teamSchema = mongoose.Schema({
  teamName: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team name is required."],
    minlength: 4,
    maxLength: 72,
    validate: /^[a-zA-Z,.,-,_ ]*$/,
  },
  teamNameAmh: {
    type: String,
    required: [
      true,
      "Custom Error - Required Value *:Team name Amharic is required.",
    ],
    minlength: 4,
    maxLength: 72,
  },
  teamCity: {
    type: String,
    minlength: 4,
    maxLength: 72,
    required: [true, "Custom Error - Required Value *:Team city is required."],
    validate: /^[a-zA-Z,.,-,_ ]*$/,
  },
  teamStadium: {
    type: String,
    minlength: 4,
    maxLength: 72,
    validate: /^[a-zA-Z,.,-,_ ]*$/,
    required: [
      true,
      "Custom Error - Required Value *:Team stadium is required.",
    ],
  },
  teamLogo: {
    type: String,
    required: [true, "Custom Error - Required Value *:Team logo is required."],
  },
  stadiumCapacity: {
    type: Number,
    min: 0,
  },
  foundedIn: {
    type: Number,
    min: 1700,
  },
  teamCoach: {
    type: String,
    minlength: 4,
    maxLength: 72,
  },
  teamPosition: {
    type: teamPosition,
  },
});

/*
=======================================
Players
=======================================
*/

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
  playerName: {
    unique: true,
    type: String,
    validate: /^[a-zA-Z,-,. ]*$/,
    minlength: 4,
    maxLength: 56,
    required: [
      true,
      "Custom Error - required Value *: Player Name is required.",
    ],
  },
  playerNameAmh: {
    // unique: true,
    type: String,
    // minlength: 4,
    // maxLength: 56,
    default: "",
    // required: [
    //   true,
    //   "Custom Error - required Value *: Player Name Amh is required.",
    // ],
  },
  eplTeamId: {
    type: String,
    minlength: 4,
    maxLength: 72,
    validate: /^[a-zA-Z,.,-,_ ]*$/,
    index: true,
    required: [
      true,
      "Custom Error - required Value *: Player Team is required.",
    ],
  },
  currentPrice: {
    type: Number,
    min: 3.5,
    required: [
      true,
      "Custom Error - required Value *: Player Price is required.",
    ],
  },
  position: {
    type: String,
    index: true,
    validate: /^[a-zA-Z,.,-,_ ]*$/,
    enum: {
      values: ["GK", "DEF", "MID", "ATT"],
      message:
        "Custom Error - Invalid ENUM Value *:{VALUE} is not allowed for game week status.",
    },
    required: [
      true,
      "Custom Error - required Value *: Player Position is required.",
    ],
  },

  playerImage: {
    type: String,
  },
  score: { type: [scoreSchema], default: [] },
  history: { type: [historySchema], default: [] },
});

/*
=======================================
Fixtures
=======================================
*/

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
  seasonId: {
    type: String,
    required: [true, "Custom Error - Required Value *:Season ID is required."],
  },
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
  schedule: {
    type: Date,
    required: [
      true,
      "Custom Error - Required Value *:Fixture Schedule ID is required.",
    ],
  },
  // Concern Here what are the possible values
  status: { type: String, default: "scheduled" },
  homeTeam: {
    type: String,
    required: [
      true,
      "Custom Error - Required Value *:Home Team is required for a fixture.",
    ],
  },
  awayTeam: {
    type: String,
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
});

// Models
const teamBkModel = bkConnection.model("teams", teamSchema);
const playersBkModel = bkConnection.model("players", playerSchema);
const fixtureBkModel = bkConnection.model("fixtures", fixtureSchema);

module.exports = { teamBkModel, playersBkModel, fixtureBkModel, bkConnection };
