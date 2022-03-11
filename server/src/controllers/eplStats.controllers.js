const asyncHandler = require("express-async-handler");
const Player = require("../models/Player2");

const overview = asyncHandler(async (_, res) => {});
const goals = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up goals across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        goals: { $sum: "$score.goals" },
      },
    },
    // Sort in ascending order
    { $sort: { goals: -1 } },
  ]).limit(10);

  res.status(200).json(result);
});
const assists = asyncHandler(async (_, res) => {});
const cleanSheets = asyncHandler(async (_, res) => {});
const reds = asyncHandler(async (_, res) => {});
const yellows = asyncHandler(async (_, res) => {});
const saves = asyncHandler(async (_, res) => {});
const minutesPlayed = asyncHandler(async (_, res) => {});

module.exports = {
  overview,
  goals,
  assists,
  cleanSheets,
  reds,
  yellows,
  saves,
  minutesPlayed,
};
