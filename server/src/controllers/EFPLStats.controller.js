const asyncHandler = require("express-async-handler");
const EFPLStats = require("../models/EFPLStats");
const GameWeek = require("../models/GameWeek");
const Player = require("../models/Player");
const Teams = require("../models/Teams");
const Users = require("../models/User");

const getStats = asyncHandler(async (req, res) => {
  const gwId = req.params.gwId;

  const activeGw = await GameWeek.find({ status: "active" }).lean();
  let activeGwId = gwId;

  // if awg found
  if (activeGw) {
    if (
      gwId.toString() === "0" ||
      gwId > activeGw[activeGw.length - 1].gameWeekNumber
    ) {
      activeGwId = activeGw[activeGw.length - 1].gameWeekNumber;
    }
  } else {
    activeGwId = 1;
  }

  const stats = await EFPLStats.find({ gameWeekNumber: activeGwId }).lean();
  stats[0].allStats.maxActiveCount = activeGwId;
  stats[0].allStats.gameWeekId = stats[0].gameWeekNumber;

  res.status(200).send(stats);
});

const updateStats = asyncHandler(async (req, res) => {
  const activeGw = await GameWeek.find({ status: "active" });
  const activeGwId =
    activeGw.length > 0 ? activeGw[activeGw.length - 1].gameWeekNumber : 0;

  // TODO:Complete
  const finalData = {
    // Done
    mostSelectedPlayer: [],
    // Done
    mostTransferredOutPlayer: [],
    // Done
    mostCaptainedPlayer: [],
    // Done
    mostViceCaptainedPlayer: [],
    // Done
    highestPoint: 0,
    // Done
    averagePoint: 0,

    // TODO:Check with Nati
    transfersMadeCount: 3000,
    benchBoostCount: 1000,
    freeHitCount: 56,
    wildCardCount: 3,
    tripleCaptainCount: 69,

    // Done
    dreamTeam: {
      goalKeeper: [],
      defenders: [],
      midfielders: [],
      attackers: [],
    },
  };

  /*
    =======================================================
    Most Selected Players
    =======================================================
  */
  const result = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        transfersIn: { $sum: "$score.transfersIn" },
      },
    },
    // Sort in ascending order
    { $sort: { transfersIn: -1, name: 1 } },
  ]).limit(3);
  const mostSelectedPlayerNames = [];
  result.forEach((player) => {
    if (player.transfersIn > 0) {
      mostSelectedPlayerNames.push(player.name);
    }
  });
  finalData.mostSelectedPlayer = mostSelectedPlayerNames;

  /*
    =======================================================
    Most Removed Players
    =======================================================
  */
  const mostRemovedResult = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        transfersOut: { $sum: "$score.transfersOut" },
      },
    },
    // Sort in ascending order
    { $sort: { transfersOut: -1, name: 1 } },
  ]).limit(3);
  const mostRemovedPlayerNames = [];
  mostRemovedResult.forEach((player) => {
    if (player.transfersOut > 0) {
      mostRemovedPlayerNames.push(player.name);
    }
  });
  finalData.mostTransferredOutPlayer = mostRemovedPlayerNames;

  /*
    =======================================================
    Most Removed Players
    =======================================================
  */
  const mostCaptainedResult = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        transfersOut: { $sum: "$score.captainCount" },
      },
    },
    // Sort in ascending order
    { $sort: { transfersOut: -1, name: 1 } },
  ]).limit(3);
  const mostCaptained = [];
  mostCaptainedResult.forEach((player) => {
    if (player.transfersOut > 0) {
      mostCaptained.push(player.name);
    }
  });
  finalData.mostCaptainedPlayer = mostCaptained;

  /*
    =======================================================
    Most Removed Players
    =======================================================
  */
  const mostViceCaptainedResult = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        transfersOut: { $sum: "$score.viceCaptainCount" },
      },
    },
    // Sort in ascending order
    { $sort: { transfersOut: -1, name: 1 } },
  ]).limit(3);
  const mostViceCaptained = [];
  mostViceCaptainedResult.forEach((player) => {
    if (player.transfersOut > 0) {
      mostViceCaptained.push(player.name);
    }
  });
  finalData.mostViceCaptainedPlayer = mostViceCaptained;

  /*
    =======================================================
    USER POINT STAT
    =======================================================
  */
  const allUserTeam = await Users.find({}).select("team").lean();
  const allUsersCount = allUserTeam.length;
  let userScoreSum = 0;
  let highestUserScore = 0;
  for (let index = 0; index < allUserTeam.length; index++) {
    let currentUserScoreSum = 0;
    //  each user info
    const currentUserPlayers = allUserTeam[index].team[activeGwId - 1].players;

    //  each player info
    for (const [key, value] of Object.entries(currentUserPlayers)) {
      if (value.multiplier !== 0) {
        const currentPlayerInfo = await Player.findOne({ playerId: key });

        currentUserScoreSum =
          currentUserScoreSum +
          currentPlayerInfo.score[activeGwId - 1].fantasyScore *
            value.multiplier;
      }
    }

    if (currentUserScoreSum > highestUserScore) {
      highestUserScore = currentUserScoreSum;
    }

    userScoreSum = userScoreSum + currentUserScoreSum;
  }
  finalData.highestPoint = highestUserScore;

  if (allUsersCount > 0 && userScoreSum > 0) {
    finalData.averagePoint = Math.floor(userScoreSum / allUsersCount);
  } else {
    finalData.averagePoint = 0;
  }

  /*
    =======================================================
    BEST TEAM BUILDERs
    =======================================================
  */
  const mostPointGk = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },
    { $match: { position: "GK" } },

    {
      $group: {
        _id: "$_id",
        eplTeamId: { $first: "$eplTeamId" },
        name: { $first: "$playerName" },
        fantasyScore: { $sum: "$score.fantasyScore" },
      },
    },
    // Sort in ascending order
    { $sort: { fantasyScore: -1, name: 1 } },
  ]).limit(1);
  const mostPointGkTeam = await Teams.findOne({
    teamName: mostPointGk[0].eplTeamId,
  });
  finalData.dreamTeam.goalKeeper.push({
    playerName: mostPointGk[0].name,
    eplTeamId: mostPointGk[0].eplTeamId,
    teamLogo: mostPointGkTeam.teamLogo,
    score: mostPointGk[0].fantasyScore,
  });

  // DEF
  const mostPointDEF = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },
    { $match: { position: "DEF" } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        eplTeamId: { $first: "$eplTeamId" },
        fantasyScore: { $sum: "$score.fantasyScore" },
      },
    },
    // Sort in ascending order
    { $sort: { fantasyScore: -1, name: 1 } },
  ]).limit(3);
  for (let i = 0; i < mostPointDEF.length; i++) {
    const mostPointDEFTeam = await Teams.findOne({
      teamName: mostPointDEF[i].eplTeamId,
    });
    finalData.dreamTeam.defenders.push({
      playerName: mostPointDEF[i].name,
      eplTeamId: mostPointDEF[i].eplTeamId,
      teamLogo: mostPointDEFTeam.teamLogo,
      score: mostPointDEF[i].fantasyScore,
    });
  }

  // MID
  const mostPointMID = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },
    { $match: { position: "MID" } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        eplTeamId: { $first: "$eplTeamId" },
        fantasyScore: { $sum: "$score.fantasyScore" },
      },
    },
    // Sort in ascending order
    { $sort: { fantasyScore: -1, name: 1 } },
  ]).limit(3);
  for (let i = 0; i < mostPointDEF.length; i++) {
    const mostPointMIDTeam = await Teams.findOne({
      teamName: mostPointMID[i].eplTeamId,
    });
    finalData.dreamTeam.midfielders.push({
      playerName: mostPointMID[i].name,
      eplTeamId: mostPointMID[i].eplTeamId,
      teamLogo: mostPointMIDTeam.teamLogo,
      score: mostPointMID[i].fantasyScore,
    });
  }

  // ATT
  const mostPointATT = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },
    { $match: { position: "ATT" } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        eplTeamId: { $first: "$eplTeamId" },
        fantasyScore: { $sum: "$score.fantasyScore" },
      },
    },
    // Sort in ascending order
    { $sort: { fantasyScore: -1, name: 1 } },
  ]).limit(1);
  const mostPointAttTeam = await Teams.findOne({
    teamName: mostPointATT[0].eplTeamId,
  });
  finalData.dreamTeam.attackers.push({
    playerName: mostPointATT[0].name,
    eplTeamId: mostPointATT[0].eplTeamId,
    teamLogo: mostPointAttTeam.teamLogo,
    score: mostPointATT[0].fantasyScore,
  });

  // fill remaining spots
  let totalCount = 1 + 3 + 3 + 1;
  let defCount = 3;
  let midCount = 3;
  let attCount = 1;

  const mostPointMISC = await Player.aggregate([
    { $unwind: "$score" },
    { $match: { "score.gameweekId": activeGwId } },

    {
      $group: {
        _id: "$_id",
        name: { $first: "$playerName" },
        position: { $first: "$position" },
        eplTeamId: { $first: "$eplTeamId" },
        fantasyScore: { $sum: "$score.fantasyScore" },
      },
    },
    // Sort in ascending order
    { $sort: { fantasyScore: -1, name: 1, position: 1 } },
  ]).limit(150);

  for (let i = 0; i < mostPointMISC.length; i++) {
    if (totalCount >= 11) {
      break;
    } else {
      const currentPlayerTeam = await Teams.findOne({
        teamName: mostPointMISC[i].eplTeamId,
      });
      const playerInfo = {
        playerName: mostPointMISC[i].name,
        eplTeamId: mostPointMISC[i].eplTeamId,
        teamLogo: currentPlayerTeam.teamLogo,
        score: mostPointMISC[i].fantasyScore,
      };
      // DEF CASES
      if (mostPointMISC[i].position === "DEF" && defCount < 5) {
        if (
          finalData.dreamTeam.defenders.filter(
            (player) => player.playerName === mostPointMISC[i].name
          ).length === 0
        ) {
          finalData.dreamTeam.defenders.push(playerInfo);
          defCount = defCount + 1;
          totalCount = totalCount + 1;
        }
      }

      // MID CASES
      else if (mostPointMISC[i].position === "MID" && midCount < 4) {
        if (
          finalData.dreamTeam.midfielders.filter(
            (player) => player.playerName === mostPointMISC[i].name
          ).length === 0
        ) {
          finalData.dreamTeam.midfielders.push(playerInfo);

          midCount = midCount + 1;
          totalCount = totalCount + 1;
        }
      }

      // ATT CASES
      else if (mostPointMISC[i].position === "ATT" && attCount < 3) {
        if (
          finalData.dreamTeam.attackers.filter(
            (player) => player.playerName === mostPointMISC[i].name
          ).length === 0
        ) {
          finalData.dreamTeam.attackers.push(playerInfo);

          attCount = attCount + 1;
          totalCount = totalCount + 1;
        }
      }
    }
  }

  await EFPLStats.updateOne({ gameWeekNumber: 1 }, { allStats: finalData });
  res.send(finalData);
});

module.exports = { updateStats, getStats };
