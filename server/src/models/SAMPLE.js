const mongoose = require("mongoose");

const gameWeekSchema = mongoose.Schema({
  gameWeekNumber: {
    type: Number,
    unique: true,
    required: [
      true,
      "Custom Error - Required Value *:Game week number is required.",
    ],
    min: [
      1,
      "Custom Error - Minimum Value *:Game week number {VALUE} does not meet minimum allowed value.",
    ],

    max: [
      18,
      "Custom Error - Maximum Value *:Game week number {VALUE} exceeds maximum allowed value.",
    ],
  },
  startTimestamp: {
    type: Number,
    required: [
      true,
      "Custom Error - Required Value *:Start timestamp is required.",
    ],
    minLength: [
      5,
      "Custom Error - Minimum Length *:Start time stamp ({VALUE}) does not meet minium required length.",
    ],
    maxLength: [
      6,
      "Custom Error - Maximum Length *:Start time stamp ({VALUE}) exceeds maximum allowed length.",
    ],
  },
  status: {
    // Options are : Played, Active , ToBePlayed , TBD
    type: String,
    required: true,
    default: "ToBePlayed",

    // These are the only possible values
    enum: {
      values: ["Played", "Active", "ToBePlayed", "TBD"],
      message:
        "Custom Error - Invalid ENUM Value *:{VALUE} is not allowed for game week status.",
    },
  },
  te: {
    type: String,
    required: [true, "Custom Error - Required Value *:Te is required."],
  },
});

module.exports = mongoose.model("GameWeek", gameWeekSchema);
