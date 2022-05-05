const asyncHandler = require("express-async-handler");
const CustomLeagueModel = require("../models/CustomLeague");

const getCustomLeague = asyncHandler(async function (req, res) {
  const { leagueId } = req.body;
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const { leagueName, adminId } = req.body;

  await new CustomLeagueModel({
    teams: [adminId],
    leagueName,
    adminId,
  }).save();
});

module.exports = { getCustomLeague, createCustomLeague };
