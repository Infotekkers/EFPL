const mongoose = require("mongoose");

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
});

const Fixture = mongoose.model("fixtures", fixtureSchema);

module.exports = Fixture;
