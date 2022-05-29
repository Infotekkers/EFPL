const asyncHandler = require("express-async-handler");
const Player = require("../models/Player");
const Teams = require("../models/Teams");

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

const getTopPlayersForEachStat = asyncHandler(async (req, res) => {
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
        position: { $first: "$position" },
        teamId: { $first: "$eplTeamId" },
        image: { $first: "$playerImage" },
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

  for (const player of aggregatedResult) {
    const teamLogo = await Teams.findOne({ teamName: player.teamId }).select(
      "teamLogo"
    );

    player.teamLogo = teamLogo.teamLogo;
  }

  result.topScorers = aggregatedResult
    .sort((a, b) => b.goals - a.goals)
    .slice(0, 5);

  result.mostAssists = aggregatedResult
    .sort((a, b) => b.assists - a.assists)
    .slice(0, 5);

  result.mostCleanSheets = aggregatedResult
    .sort((a, b) => b.cleanSheets - a.cleanSheets)
    .slice(0, 5);

  result.mostReds = aggregatedResult
    .sort((a, b) => b.reds - a.reds)
    .slice(0, 5);

  result.mostYellows = aggregatedResult
    .sort((a, b) => b.yellows - a.yellows)
    .slice(0, 5);

  result.mostSaves = aggregatedResult
    .sort((a, b) => b.saves - a.saves)
    .slice(0, 5);

  result.mostMinutesPlayed = aggregatedResult
    .sort((a, b) => b.minutesPlayed - a.minutesPlayed)
    .slice(0, 5);

  res.status(200).json(result);
});

const goals = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        goals: { $sum: "$score.goals" },
      },
    },
    // Sort in descending order then ascending order of name
    { $sort: { goals: -1, name: 1 } },
  ]).limit(10);
  res.status(200).json(result);
});

const assists = asyncHandler(async (_, res) => {
  const result = await Player.aggregate([
    //   Fetch score
    { $unwind: "$score" },
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
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
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
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
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
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
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
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
    //  Sum up minutes played across gameweeks
    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
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
        name: { $first: "$playerName" },
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
  getTopPlayersForEachStat,
  goals,
  assists,
  cleanSheets,
  reds,
  yellows,
  saves,
  minutesPlayed,
};
