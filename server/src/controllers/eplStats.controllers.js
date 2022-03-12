const asyncHandler = require("express-async-handler");
const Player = require("../models/Player2");

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
        name: { $first: "$name" },
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
    { $sort: { goals: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const assists = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up assists across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        assists: { $sum: "$score.assists" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { assists: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const cleanSheets = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up clean sheets across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        cleanSheets: { $sum: "$score.cleanSheets" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { cleanSheets: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const reds = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up reds across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        reds: { $sum: "$score.reds" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { reds: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const yellows = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up yellows across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        yellows: { $sum: "$score.yellows" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { yellows: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const saves = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up saves across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        saves: { $sum: "$score.saves" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { saves: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

const minutesPlayed = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$name" },
        minutesPlayed: { $sum: "$score.minutesPlayed" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { minutesPlayed: -1, name: 1 } },
  ]).limit(10);

  res.status(200).json(result);
});

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
