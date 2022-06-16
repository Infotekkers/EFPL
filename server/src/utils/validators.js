const Player = require("../models/Player");

// TODO: Check if multipliers are valid
const validateTeam = async (team, availableChips) => {
  let teamBudget = 0;

  let isCaptainUnique = false;
  let isViceCaptainUnique = false;
  const eplTeamPlayerCounter = {};
  const positionCounter = { gk: 0, def: 0, mid: 0, att: 0, starters: 0 };

  // 15 players
  if (Object.keys(team.players).length !== 15)
    return [false, { message: "Incomplete team!" }];

  for (const playerId in team.players) {
    teamBudget += parseInt(team.players[playerId].price);

    // Unique captain and vice-captain
    if (team.players[playerId].isCaptain) {
      isCaptainUnique = !isCaptainUnique;
    }
    if (team.players[playerId].isViceCaptain)
      isViceCaptainUnique = !isViceCaptainUnique;

    // Three player limit
    if (
      typeof eplTeamPlayerCounter[team.players[playerId].eplTeamId] ===
      "undefined"
    )
      eplTeamPlayerCounter[team.players[playerId].eplTeamId] = 1;
    else if (eplTeamPlayerCounter[team.players[playerId].eplTeamId] === 3)
      return [
        false,
        { message: `Three player limit exceeded by player ${playerId}` },
      ];
    else eplTeamPlayerCounter[team.players[playerId].eplTeamId] += 1;

    const currentPlayer = await Player.findOne({ playerId: playerId })
      .lean()
      .select("position -_id");

    if (currentPlayer.position === "GK") positionCounter.gk += 1;
    else if (currentPlayer.position === "DEF") positionCounter.def += 1;
    else if (currentPlayer.position === "MID") positionCounter.mid += 1;
    else if (currentPlayer.position === "ATT") positionCounter.att += 1;

    if (team.players[playerId].multiplier > 0) positionCounter.starters += 1;
  }

  // Lineup check
  if (positionCounter.gk !== 2)
    return [
      false,
      {
        message: `Invalid number of goalkeepers. Your no of goalkeepers: ${positionCounter.gk}`,
      },
    ];
  if (positionCounter.def !== 5)
    return [
      false,
      {
        message: `Invalid number of defenders. Your no of defenders ${positionCounter.def}`,
      },
    ];
  if (positionCounter.mid !== 5)
    return [
      false,
      {
        message: `Invalid number of midfielders. Your no of midfielders ${positionCounter.mid}`,
      },
    ];
  if (positionCounter.att !== 3)
    return [
      false,
      {
        message: `Invalid number of attackers. Your no of attackers ${positionCounter.att}`,
      },
    ];
  if (positionCounter.starters !== 11)
    return [
      false,
      {
        message: `Invalid number of starters. Your no of starters ${positionCounter.starters}`,
      },
    ];

  // Valid active chip
  if (availableChips.includes(team.activeChip) !== true && team.activeChip)
    return [false, { message: `Invalid active chip: ${team.activeChip}` }];

  // Overbudget
  if (teamBudget > 100)
    return [
      false,
      {
        message: `Team budget exceeded over 100. Current team budget ${teamBudget}`,
      },
    ];

  // Unique captain
  if (!isCaptainUnique) return [false, { message: "Captain is not unique!" }];

  // Unique vice-captain
  if (!isViceCaptainUnique)
    return [false, { message: "Vice-captain is not unique!" }];

  return [true];
};

// new
const processTeamIdToData = async (match) => {
  const finalBothLineups = [{}, {}];
  const gameWeekId = match.gameweekId;
  // Convert Player ID to name & position
  if (match.homeTeamLineUp) {
    const processedHomeTeamLineUp = {};
    const lineUp = match.homeTeamLineUp.lineup;

    // process GK
    for (let i = 0; i < lineUp.goalkeepers.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.goalkeepers[i],
      }).select("playerName position playerId -_id score");

      // get player stat
      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      processedHomeTeamLineUp.goalkeepers = [finalPlayerInfo];
    }

    // process def
    const allDefs = [];
    for (let i = 0; i < lineUp.defenders.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.defenders[i],
      }).select("playerName position playerId -_id score");

      // get player stat
      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allDefs.push(finalPlayerInfo);
    }
    processedHomeTeamLineUp.defenders = allDefs;

    // process mid
    const allMid = [];
    for (let i = 0; i < lineUp.midfielders.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.midfielders[i],
      }).select("playerName position playerId -_id score");

      // get player stat
      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allMid.push(finalPlayerInfo);
    }
    processedHomeTeamLineUp.midfielders = allMid;

    // process att
    const allAtt = [];
    for (let i = 0; i < lineUp.strikers.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.strikers[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allAtt.push(finalPlayerInfo);
    }
    processedHomeTeamLineUp.strikers = allAtt;

    // process bench
    const allBen = [];
    for (let i = 0; i < lineUp.bench.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.bench[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allBen.push(finalPlayerInfo);
    }
    processedHomeTeamLineUp.bench = allBen;

    finalBothLineups[0] = processedHomeTeamLineUp;
  }

  if (match.awayTeamLineUp) {
    const processedAwayTeamLineUp = {};
    const lineUp = match.awayTeamLineUp.lineup;

    // process GK
    for (let i = 0; i < lineUp.goalkeepers.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.goalkeepers[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      processedAwayTeamLineUp.goalkeepers = [finalPlayerInfo];
    }

    // process def
    const allDefs = [];
    for (let i = 0; i < lineUp.defenders.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.defenders[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allDefs.push(finalPlayerInfo);
    }
    processedAwayTeamLineUp.defenders = allDefs;

    // process mid
    const allMid = [];
    for (let i = 0; i < lineUp.midfielders.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.midfielders[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allMid.push(finalPlayerInfo);
    }
    processedAwayTeamLineUp.midfielders = allMid;

    // process att
    const allAtt = [];
    for (let i = 0; i < lineUp.strikers.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.strikers[i],
      }).select("playerName position playerId -_id score");
      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allAtt.push(finalPlayerInfo);
    }
    processedAwayTeamLineUp.strikers = allAtt;

    // process bench
    const allBen = [];
    for (let i = 0; i < lineUp.bench.length; i++) {
      const currPlayer = await Player.findOne({
        playerId: lineUp.bench[i],
      }).select("playerName position playerId -_id score");

      const allCurrPlayerStat = currPlayer.score;
      const currPlayerStat = allCurrPlayerStat.filter((stat) => {
        return stat.gameweekId === gameWeekId;
      });

      const finalPlayerInfo = {
        playerId: currPlayer.playerId,
        playerName: currPlayer.playerName,
        position: currPlayer.position,
        playerStat: currPlayerStat,
      };

      allBen.push(finalPlayerInfo);
    }
    processedAwayTeamLineUp.bench = allBen;

    finalBothLineups[1] = processedAwayTeamLineUp;
  }

  return finalBothLineups;
};

// new

module.exports = {
  validateTeam,
  processTeamIdToData,
};
