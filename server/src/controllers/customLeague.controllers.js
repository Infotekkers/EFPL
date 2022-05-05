const asyncHandler = require("express-async-handler");
const CustomLeagueModel = require("../models/CustomLeague");

const getCustomLeague = asyncHandler(async function (req, res) {});

const getAllCustomLeagues = asyncHandler(async function (req, res) {
  const result = await CustomLeagueModel.find({});

  res.send(result);
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const { leagueName, adminId } = req.body;
  let { type } = req.body;

  if (type in ["Public", "Private"] === false) {
    type = "Public";
  }

  await new CustomLeagueModel({
    teams: [adminId],
    type,
    leagueName,
    adminId,
    leagueStartGameWeek: 1,
  }).save();

  res.send(`Custom league '${leagueName}' created!`);
});

module.exports = { getCustomLeague, createCustomLeague, getAllCustomLeagues };
