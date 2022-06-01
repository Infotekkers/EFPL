const asyncHandler = require("express-async-handler");

const UserModel = require("../models/User");
const CustomLeagueModel = require("../models/CustomLeague");

const getAllCustomLeagues = asyncHandler(async function (req, res) {
  const result = await CustomLeagueModel.find({});

  res.send(result);
});

const getUserCustomLeagues = asyncHandler(async function (req, res) {
  // console.log("requested");
  const { userId } = req.params;

  const user = await UserModel.findOne({ id: userId });

  res.json(user.fantasyLeagues);
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const {
    adminId,
    leagueName,
    leagueType = "Public",
    leagueStartGameWeek = 1,
  } = req.body;

  const user = await UserModel.findOne({ id: adminId });

  const createdLeague = await new CustomLeagueModel({
    teams: [
      {
        memberId: adminId,
        memberTeamName: user.teamName,
        memberPoints: 0,
      },
    ],
    leagueType,
    leagueName,
    adminId,
    leagueStartGameWeek,
  }).save();

  user.fantasyLeagues.push({
    leagueId: createdLeague.leagueId,
    leagueName: createdLeague.leagueName,
    previousRank: 1,
  });

  await user.save();

  res.send(`Custom league '${leagueName}' created!`);
});

// TODO: remove players from classic league
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
  const { userId, leagueId, leagueCode } = req.body;

  const user = await UserModel.findOne({ id: userId });
  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    return res
      .status(400)
      .send("Couldn't find a custom league with the provided ID!");
  }

  if (!user) {
    return res.status(400).send("Couldn't find a user with the provided ID!");
  }

  if (customLeague.teams.includes(userId)) {
    return res
      .status(400)
      .send("Player is already a member of the custom league!");
  }

  if (customLeague.leagueType === "Public") {
    customLeague.teams.push(userId);
    user.fantasyLeagues.push(customLeague.leagueId);

    res.send(`Successfully joined ${customLeague.leagueName}!`);
  } else {
    if (customLeague.leagueCode === leagueCode) {
      customLeague.teams.push(userId);
      user.fantasyLeagues.push(customLeague.leagueId);

      res.send(`Successfully joined ${customLeague.leagueName}!`);
    } else {
      return res.status(400).send("Incorrect league code!");
    }
  }

  await user.save();
  await customLeague.save();
});

const leaveCustomLeague = asyncHandler(async (req, res) => {
  const { leagueId, userId } = req.body;

  const user = await UserModel.findOne({ id: userId });
  const customLeague = await CustomLeagueModel.findOne({ leagueId });

  if (!customLeague) {
    return res
      .status(400)
      .send("Couldn't find a custom league with the provided ID!");
  }

  if (!user) {
    return res.status(400).send("Couldn't find a user with the provided ID!");
  }

  if (!customLeague.teams.includes(userId)) {
    return res
      .status(400)
      .send("Player is not a member of this custom league!");
  }

  customLeague.teams = customLeague.teams.filter((teamId) => teamId !== userId);
  user.fantasyLeagues = user.fantasyLeagues.filter(
    (league) => league.leaugeId !== leagueId
  );

  await customLeague.save();
  await user.save();

  res.send(`Successfully left ${customLeague.leagueName}!`);
});

const clearAllCustomLeagues = asyncHandler(async (req, res) => {
  await CustomLeagueModel.deleteMany({});

  res.send("done");
});

module.exports = {
  getAllCustomLeagues,
  getUserCustomLeagues,
  createCustomLeague,
  deleteCustomLeague,
  joinCustomLeague,
  leaveCustomLeague,
  removePlayerFromCustomLeague,
  clearAllCustomLeagues,
};
