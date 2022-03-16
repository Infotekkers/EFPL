const asyncHandler = require("express-async-handler");
const Stats2 = require("../models/Stats2");

// get one stat
const fetchFantasyStat = asyncHandler(async (req, res) => {
  const stat = await Stats2.findById(req.params.id);
  if (stat == null) {
    return res.status(404).json({ message: "no stat found" });
  }
  res.stat = stat;
  res.json(res.stat);
});

// get all stats
const fetchAllFantasyStats = asyncHandler(async (req, res) => {
  const stats = await Stats2.find();
  res.json(stats);
});

// add stats
const addFantasyStats = asyncHandler(async (req, res) => {
  // create stats
  const stat = new Stats2({
    fixtureId: req.body.fixtureId,
    minutesPlayed: req.body.minutesPlayed,
    goalsScored: req.body.goalsScored,
    assists: req.body.assists,
    yellows: req.body.yellows,
    reds: req.body.reds,
    penaltiesMissed: req.body.penaltiesMissed,
    saves: req.body.saves,
    fantasyScores: req.body.fantasyScores,
  });

  // save to db
  const savedStats = await stat.save();
  res.send(savedStats);
});

// update stats
// const updateFantasyStats = asyncHandler(async(req,res)=>{

// })

// delete stats
const deleteFantasyStats = asyncHandler(async (req, res) => {
  const stat = await Stats2.findById(req.params.id);
  if (stat == null) {
    return res.status(404).json({ message: "no stat found" });
  }
  res.stat = stat;

  // delete stat
  await res.stat.remove();
  res.json({ message: `stat for ${stat.fixtureId} removed` });
});

module.exports = {
  fetchFantasyStat,
  fetchAllFantasyStats,
  addFantasyStats,
  deleteFantasyStats,
};
