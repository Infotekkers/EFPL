const mongoose = require("mongoose");

const dreamTeamSchema = mongoose.Schema({
  goalKeeper: [],
  defenders: [],
  midfielders: [],
  attackers: [],
});

const efplGameWeekSchema = mongoose.Schema({
  gameWeekNumber: {
    type: Number,
  },
  highestPoint: {
    type: Number,
  },
  averagePoint: {
    type: Number,
  },
  mostSelectedPlayer: {
    type: Array,
    default: [],
  },
  mostTransferredOutPlayer: {
    type: Array,
    default: [],
  },
  transfersMadeCount: {
    type: Number,
    default: 0,
  },
  mostCaptainedPlayer: { type: Array, default: [] },
  mostViceCaptainedPlayer: {
    type: Array,
    default: [],
  },
  benchBoostCount: {
    type: Number,
    default: 0,
  },
  freeHitCount: {
    type: Number,
    default: 0,
  },
  wildCardCount: {
    type: Number,
    default: 0,
  },
  tripleCaptainCount: {
    type: Number,
    default: 0,
  },
  dreamTeam: {
    type: dreamTeamSchema,
  },
});

const efplStatsSchema = mongoose.Schema({
  allStats: efplGameWeekSchema,
  gameWeekNumber: { type: Number },
});

module.exports = mongoose.model("EFPLStat", efplStatsSchema);
