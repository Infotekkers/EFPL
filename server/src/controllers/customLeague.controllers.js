const asyncHandler = require("express-async-handler");
const CustomLeagueModel = require("../models/CustomLeague");

const getAllCustomLeagues = asyncHandler(async function (req, res) {
  const result = await CustomLeagueModel.find({});

  res.send(result);
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const {
    leagueName,
    adminId,
    type = "Public",
    leagueStartGameWeek = 1,
  } = req.body;

  await new CustomLeagueModel({
    teams: [adminId],
    type,
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
