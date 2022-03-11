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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
    // Sort in ascending order
    { $sort: { goals: -1 } },
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
