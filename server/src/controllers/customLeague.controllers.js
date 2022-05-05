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

const deleteCustomLeague = asyncHandler(async function (req, res) {
  const { leagueId, adminId } = req.body;

  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    res.status(400).send("Couldn't find a custom league with the provided ID!");
  }

  if (adminId === customLeague.adminId) {
    await CustomLeagueModel.deleteOne({ leagueId });
    res.send(
      `Custom league ${customLeague.leagueName} has successfully been deleted!`
    );
  } else {
    res.status(401).send("Unauthorized!");
  }
});

const removePlayerFromCustomLeague = asyncHandler(async function (req, res) {
  const { adminId, playerId, leagueId } = req.body;

  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    res.status(400).send("Couldn't find a custom league with the provided ID!");
  }

  if (!customLeague.teams.includes(playerId)) {
    res.status(400).send("Player is not a member of this custom league!");
  }

  if (adminId === customLeague.adminId) {
    customLeague.teams = customLeague.teams.filter(
      (teamId) => teamId !== playerId
    );
    res.send("Player successfully removed!");
  } else {
    res.status(401).send("Unauthorized!");
  }

  await customLeague.save();
});

const joinCustomLeague = asyncHandler(async function (req, res) {
  const { playerId, leagueId, leagueCode } = req.body;

  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    res.status(400).send("Couldn't find a custom league with the provided ID!");
  }

  if (customLeague.teams.includes(playerId)) {
    res.status(400).send("Player is already a member of the custom league!");
  }

  if (customLeague.leagueType === "Public") {
    customLeague.teams.push(playerId);
    res.send(`Successfully joined ${customLeague.leagueName}!`);
  } else {
    if (customLeague.leagueCode === leagueCode) {
      customLeague.teams.push(playerId);
      res.send(`Successfully joined ${customLeague.leagueName}!`);
    } else {
      res.status(400).send("Incorrect league code!");
    }
  }

  await customLeague.save();
});

const leaveCustomLeague = asyncHandler(async (req, res) => {
  const { leagueId, playerId } = req.body;

  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    res.status(400).send("Couldn't find a custom league with the provided ID!");
  }

  if (!customLeague.teams.includes(playerId)) {
    res.status(400).send("Player is not a member of this custom league!");
  }

  customLeague.teams = customLeague.teams.filter(
    (teamId) => teamId !== playerId
  );

  await customLeague.save();

  res.send(`Successfully left ${customLeague.leagueName}!`);
});

const clearAllCustomLeagues = asyncHandler(async (req, res) => {
  await CustomLeagueModel.deleteMany({});

  res.send("done");
});

module.exports = {
  getAllCustomLeagues,
  createCustomLeague,
  deleteCustomLeague,
  joinCustomLeague,
  leaveCustomLeague,
  removePlayerFromCustomLeague,
  clearAllCustomLeagues,
};
