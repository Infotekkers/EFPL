const asyncHandler = require("express-async-handler");

const UserModel = require("../models/User");
const CustomLeagueModel = require("../models/CustomLeague");

const getCustomLeagueInfo = asyncHandler(async function (req, res) {
  const { customLeagueId } = req.params;

  const customLeague = await CustomLeagueModel.findOne({
    leagueId: customLeagueId,
  });

  res.send(customLeague);
});

const getUserCustomLeagues = asyncHandler(async function (req, res) {
  const { userId } = req.params;

  const user = await UserModel.findOne({ _id: userId });

  if (!user) {
    return res.status(400).send("Couldn't find a user with the provided ID!");
  }

  res.json(user.fantasyLeagues);
});

const createCustomLeague = asyncHandler(async function (req, res) {
  const {
    adminId,
    leagueName,
    leagueType = "Public",
    leagueStartGameWeek = 1,
  } = req.body;

  const user = await UserModel.findOne({ _id: adminId });

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

  res.send(createdLeague);
});

// TODO: remove custom league from player's lists or mark as deleted
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
  const { userId, leagueCode } = req.body;

  const user = await UserModel.findOne({ _id: userId });
  const customLeague = await CustomLeagueModel.findOne({ leagueCode });

  if (!customLeague) {
    return res
      .status(400)
      .send("Couldn't find a custom league with the provided ID!");
  }

  if (!user) {
    return res.status(400).send("Couldn't find a user with the provided ID!");
  }

  if (customLeague.teams.find(({ memberId }) => memberId === user.id)) {
    return res
      .status(400)
      .send("Player is already a member of the custom league!");
  }

  if (customLeague.leagueType === "Public") {
    customLeague.teams.push({
      memberId: user.id,
      memberTeamName: user.teamName,
      memberPoints: 0,
    });
    user.fantasyLeagues.push({
      leagueId: customLeague.leagueId,
      leagueName: customLeague.leagueName,
      previousRank: 1,
    });
  } else {
    if (customLeague.leagueCode === leagueCode) {
      customLeague.teams.push({
        memberId: user.id,
        memberTeamName: user.teamName,
        memberPoints: 0,
      });
      user.fantasyLeagues.push({
        leagueId: customLeague.leagueId,
        leagueName: customLeague.leagueName,
        previousRank: 1,
      });
    } else {
      return res.status(400).send("Incorrect league code!");
    }
  }

  await user.save();
  await customLeague.save();

  res.send(customLeague);
});

const leaveCustomLeague = asyncHandler(async (req, res) => {
  console.log("here");

  const { userId, leagueCode } = req.body;

  const user = await UserModel.findOne({ _id: userId });
  const customLeague = await CustomLeagueModel.findOne({ leagueCode });

  if (!customLeague) {
    return res
      .status(400)
      .send("Couldn't find a custom league with the provided ID!");
  }

  if (!user) {
    return res.status(400).send("Couldn't find a user with the provided ID!");
  }

  if (!customLeague.teams.find(({ memberId }) => memberId === user.id)) {
    return res
      .status(400)
      .send("Player is not a member of this custom league!");
  }

  customLeague.teams = await customLeague.teams.filter(
    (team) => team.memberId !== userId
  );

  user.fantasyLeagues = await user.fantasyLeagues.filter(
    (league) => league.leagueId !== customLeague.leagueId
  );

  // await customLeague.save();
  // await user.save();

  res.send(`Successfully left ${customLeague.leagueName}!`);
});

const clearAllCustomLeagues = asyncHandler(async (req, res) => {
  await CustomLeagueModel.deleteMany({});

  res.send("done");
});

module.exports = {
  getCustomLeagueInfo,
  getUserCustomLeagues,
  createCustomLeague,
  deleteCustomLeague,
  joinCustomLeague,
  leaveCustomLeague,
  removePlayerFromCustomLeague,
  clearAllCustomLeagues,
};
