const asyncHandler = require("express-async-handler");
const Player = require("../models/Player");

const overview = asyncHandler(async (_, res) => {
  const result = {};

  // Aggregate result
  const aggregatedResult = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up stats across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        goals: { $sum: "$score.goals" },
        assists: { $sum: "$score.assists" },
        cleanSheets: { $sum: "$score.cleanSheets" },
        reds: { $sum: "$score.reds" },
        yellows: { $sum: "$score.yellows" },
        saves: { $sum: "$score.saves" },
        minutesPlayed: { $sum: "$score.minutesPlayed" },
      },
    },
    {
      $sort: { name: 1 },
    },
  ]);

  // Get the highest achiever in each stat category
  result.mostGoals = aggregatedResult.sort((a, b) => b.goals - a.goals)[0];
  result.mostAssists = aggregatedResult.sort(
    (a, b) => b.assists - a.assists
  )[0];
  result.mostCleanSheets = aggregatedResult.sort(
    (a, b) => b.cleanSheets - a.cleanSheets
  )[0];
  result.mostReds = aggregatedResult.sort((a, b) => b.reds - a.reds)[0];
  result.mostYellows = aggregatedResult.sort(
    (a, b) => b.yellows - a.yellows
  )[0];
  result.mostSaves = aggregatedResult.sort((a, b) => b.saves - a.saves)[0];
  result.mostMinutesPlayed = aggregatedResult.sort(
    (a, b) => b.minutesPlayed - a.minutesPlayed
  )[0];

  res.status(200).json(result);
});

const getTopPlayersByStat = asyncHandler(async (req, res) => {
  const { statType } = req.params;

  const result = await Player.aggregate([
    { $unwind: "$score" },
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        position: { $first: "$position" },
        teamId: { $first: "$eplTeamId" },
        image: { $first: "$playerImage" },
        amount: { $sum: `$score.${statType}` },
      },
    },
    { $sort: { amount: -1, name: 1 } },
  ]).limit(5);

  res.status(200).json(result);
});

module.exports = {
  overview,
  getTopPlayersByStat,
  // goals,
  // assists,
  // cleanSheets,
  // reds,
  // yellows,
  // saves,
  // minutesPlayed,
};
