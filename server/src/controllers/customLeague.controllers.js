const asyncHandler = require("express-async-handler");
const CustomLeagueModel = require("../models/CustomLeague");

const getAllCustomLeagues = asyncHandler(async function (req, res) {
  const result = await CustomLeagueModel.find({});

  res.send(result);
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const {
    adminId,
    leagueName,
    leagueType = "Public",
    leagueStartGameWeek = 1,
  } = req.body;

  await new CustomLeagueModel({
    teams: [adminId],
    leagueType,
    leagueName,
    adminId,
    leagueStartGameWeek,
  }).save();

  res.send(`Custom league '${leagueName}' created!`);
});

const clear = async (req, res) => {
  await CustomLeagueModel.deleteMany({});

  res.send("done");
};

module.exports = {
  createCustomLeague,
  getAllCustomLeagues,
  clear,
};
