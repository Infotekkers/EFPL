const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

const fs = require("fs");
const fse = require("fs-extra");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

// Function to generate JWT Token
const generateJWTToken = expressAsyncHandler(async (id) => {
  return JWT.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: "5d",
  });
});

// Function to deduct points from user team
const pointDeductor = (activeTeam, incomingTeam) => {
  let deduction = activeTeam.deduction;
  let transfersMade = 0;

  // Check if wildcard or free hit chips are active
  if (incomingTeam.activeChip === "WC" || incomingTeam.activeChip === "FH")
    deduction = 0;
  else {
    // Loop over playerIds of incomingTeam
    for (const playerId of Object.entries(incomingTeam.players)) {
      // Check if the playerIds are in the activeTeam
      if (playerId in activeTeam.players) continue;
      // If not deduct 4 points
      deduction += 4;
      transfersMade += 1;
    }

    // Use free transfers if any
    deduction -= 4 * activeTeam.freeTransfers;
  }

  return [deduction, transfersMade];
};

// Function to apply statistical updates to existing teams
const statUpdater = ({ activeMatch, activePlayer, incomingUpdate }) => {
  const {
    gameweekId,
    minutesPlayed,
    goals,
    assists,
    cleanSheet,
    yellows,
    reds,
    penalitiesMissed,
    penalitiesSaved,
    saves,
    ownGoal,
    fantasyScore,
  } = incomingUpdate;

  // TODO: Set Fantasy Score
  activePlayer.score[gameweekId - 1].minutesPlayed = minutesPlayed;
  activePlayer.score[gameweekId - 1].goals = goals;
  activePlayer.score[gameweekId - 1].assists = assists;
  activePlayer.score[gameweekId - 1].cleanSheet = cleanSheet;
  activePlayer.score[gameweekId - 1].yellows = yellows;
  activePlayer.score[gameweekId - 1].reds = reds;
  activePlayer.score[gameweekId - 1].penalitiesMissed = penalitiesMissed;
  activePlayer.score[gameweekId - 1].penalitiesSaved = penalitiesSaved;
  activePlayer.score[gameweekId - 1].saves = saves;
  activePlayer.score[gameweekId - 1].ownGoal = ownGoal;
  activePlayer.score[gameweekId - 1].fantasyScore = fantasyScore;

  // * Compatability layer to achieve data synchronization with redundant layer in Fixture.MatchStats / Player.score
  const compatFixture = {
    minutesPlayed: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfMinutes: minutesPlayed,
      },
    },
    goalsScored: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfGoals: goals,
      },
    },
    assists: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfAssists: assists,
      },
    },
    cleanSheets: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfCleanSheets: cleanSheet,
      },
    },
    yellows: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfYellows: yellows,
      },
    },
    reds: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfReds: reds,
      },
    },
    penaltiesMissed: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfPenMissed: penalitiesMissed,
      },
    },
    penaltiesSaved: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfPenSaved: penalitiesSaved,
      },
    },
    saves: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfSaved: saves,
      },
    },
    ownGoal: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        noOfOwnGoals: ownGoal,
      },
    },
    fantasyScores: {
      [activePlayer.playerId]: {
        playerId: activePlayer.playerId,
        playerScores: fantasyScore,
      },
    },
  };

  for (const position in activeMatch.homeTeamLineUp.lineup) {
    if (position === "on") break;
    for (const playerId of activeMatch.homeTeamLineUp.lineup[position]) {
      activeMatch.matchStat.minutesPlayed[playerId] =
        compatFixture.minutesPlayed && playerId in compatFixture.minutesPlayed
          ? compatFixture.minutesPlayed[playerId]
          : null ?? activeMatch.matchStat.minutesPlayed[playerId] ?? {};

      activeMatch.matchStat.goalsScored[playerId] =
        compatFixture.goalsScored && playerId in compatFixture.goalsScored
          ? compatFixture.goalsScored[playerId]
          : activeMatch.matchStat.goalsScored[playerId] ?? {};

      activeMatch.matchStat.assists[playerId] =
        compatFixture.assists && playerId in compatFixture.assists
          ? compatFixture.assists[playerId]
          : null ?? activeMatch.matchStat.assists[playerId] ?? {};

      activeMatch.matchStat.cleanSheet[playerId] =
        compatFixture.cleanSheet && playerId in compatFixture.cleanSheet
          ? compatFixture.cleanSheet[playerId]
          : null ?? activeMatch.matchStat.cleanSheet[playerId] ?? {};

      activeMatch.matchStat.yellows[playerId] =
        compatFixture.yellows && playerId in compatFixture.yellows
          ? compatFixture.yellows[playerId]
          : null ?? activeMatch.matchStat.yellows[playerId] ?? {};

      activeMatch.matchStat.reds[playerId] =
        compatFixture.reds && playerId in compatFixture.reds
          ? compatFixture.reds[playerId]
          : null ?? activeMatch.matchStat.reds[playerId] ?? {};

      activeMatch.matchStat.penaltiesMissed[playerId] =
        compatFixture.penaltiesMissed &&
        playerId in compatFixture.penaltiesMissed
          ? compatFixture.penaltiesMissed[playerId]
          : null ?? activeMatch.matchStat.penaltiesMissed[playerId] ?? {};

      activeMatch.matchStat.penaltiesSaved[playerId] =
        compatFixture.penaltiesSaved && playerId in compatFixture.penaltiesSaved
          ? compatFixture.penaltiesSaved[playerId]
          : null ?? activeMatch.matchStat.penaltiesSaved[playerId] ?? {};

      activeMatch.matchStat.saves[playerId] =
        compatFixture.saves && playerId in compatFixture.saves
          ? compatFixture.saves[playerId]
          : null ?? activeMatch.matchStat.saves[playerId] ?? {};

      activeMatch.matchStat.ownGoal[playerId] =
        compatFixture.ownGoal && playerId in compatFixture.ownGoal
          ? compatFixture.ownGoal[playerId]
          : null ?? activeMatch.matchStat.ownGoal[playerId] ?? {};

      activeMatch.matchStat.fantasyScores[playerId] =
        compatFixture.fantasyScores && playerId in compatFixture.fantasyScores
          ? compatFixture.fantasyScores[playerId]
          : null ?? activeMatch.matchStat.fantasyScores[playerId] ?? {};
    }
  }

  for (const position in activeMatch.awayTeamLineUp.lineup) {
    if (position === "on") break;
    for (const playerId of activeMatch.awayTeamLineUp.lineup[position]) {
      activeMatch.matchStat.minutesPlayed[playerId] =
        compatFixture.minutesPlayed && playerId in compatFixture.minutesPlayed
          ? compatFixture.minutesPlayed[playerId]
          : null ?? activeMatch.matchStat.minutesPlayed[playerId] ?? {};

      activeMatch.matchStat.goalsScored[playerId] =
        compatFixture.goalsScored && playerId in compatFixture.goalsScored
          ? compatFixture.goalsScored[playerId]
          : activeMatch.matchStat.goalsScored[playerId] ?? {};

      activeMatch.matchStat.assists[playerId] =
        compatFixture.assists && playerId in compatFixture.assists
          ? compatFixture.assists[playerId]
          : null ?? activeMatch.matchStat.assists[playerId] ?? {};

      activeMatch.matchStat.cleanSheet[playerId] =
        compatFixture.cleanSheet && playerId in compatFixture.cleanSheet
          ? compatFixture.cleanSheet[playerId]
          : null ?? activeMatch.matchStat.cleanSheet[playerId] ?? {};

      activeMatch.matchStat.yellows[playerId] =
        compatFixture.yellows && playerId in compatFixture.yellows
          ? compatFixture.yellows[playerId]
          : null ?? activeMatch.matchStat.yellows[playerId] ?? {};

      activeMatch.matchStat.reds[playerId] =
        compatFixture.reds && playerId in compatFixture.reds
          ? compatFixture.reds[playerId]
          : null ?? activeMatch.matchStat.reds[playerId] ?? {};

      activeMatch.matchStat.penaltiesMissed[playerId] =
        compatFixture.penaltiesMissed &&
        playerId in compatFixture.penaltiesMissed
          ? compatFixture.penaltiesMissed[playerId]
          : null ?? activeMatch.matchStat.penaltiesMissed[playerId] ?? {};

      activeMatch.matchStat.penaltiesSaved[playerId] =
        compatFixture.penaltiesSaved && playerId in compatFixture.penaltiesSaved
          ? compatFixture.penaltiesSaved[playerId]
          : null ?? activeMatch.matchStat.penaltiesSaved[playerId] ?? {};

      activeMatch.matchStat.saves[playerId] =
        compatFixture.saves && playerId in compatFixture.saves
          ? compatFixture.saves[playerId]
          : null ?? activeMatch.matchStat.saves[playerId] ?? {};

      activeMatch.matchStat.ownGoal[playerId] =
        compatFixture.ownGoal && playerId in compatFixture.ownGoal
          ? compatFixture.ownGoal[playerId]
          : null ?? activeMatch.matchStat.ownGoal[playerId] ?? {};

      activeMatch.matchStat.fantasyScores[playerId] =
        compatFixture.fantasyScores && playerId in compatFixture.fantasyScores
          ? compatFixture.fantasyScores[playerId]
          : null ?? activeMatch.matchStat.fantasyScores[playerId] ?? {};
    }
  }

  return { updatedMatch: activeMatch, updatedPlayer: activePlayer };
};

// Function to change base64 to file
const makeFile = (fileContent, logoName) => {
  // Check base64 format
  const matches = fileContent.match(/^data:([A-Za-z-+/]+);base64,(.+)$/);
  if (matches.length !== 3) {
    return "";
  } else {
    // create buffer
    const imageBuffer = Buffer.from(matches[2], "base64");
    const itemName = logoName.split(".");
    const itemFileName = uuidv4() + "." + itemName[itemName.length - 1];

    const filePath = path.join(
      path.resolve("./"),
      "uploads/teams",
      itemFileName
    );

    try {
      fs.writeFileSync(filePath, imageBuffer, "utf-8");
      return "/uploads/teams/" + itemFileName;
    } catch (e) {
      return "";
    }
  }
};

// Function to change base64 to file
const makeFilePlayer = (fileContent, logoName) => {
  // Check base64 format
  const matches = fileContent.match(/^data:([A-Za-z-+/]+);base64,(.+)$/);
  if (matches.length !== 3) {
    return "";
  } else {
    // create buffer
    const imageBuffer = Buffer.from(matches[2], "base64");
    const itemName = logoName.split(".");
    const itemFileName = uuidv4() + "." + itemName[itemName.length - 1];

    const filePath = path.join(
      path.resolve("./"),
      "uploads/players",
      itemFileName
    );

    try {
      fs.writeFileSync(filePath, imageBuffer, "utf-8");
      return "/uploads/players/" + itemFileName;
    } catch (e) {
      return "";
    }
  }
};

const moveFile = async (sourcePath, destinationPath) => {
  try {
    fse.copy(sourcePath, destinationPath, { overwrite: true });
    return true;
  } catch (e) {
    return false;
  }
};

module.exports = {
  generateJWTToken,
  pointDeductor,
  statUpdater,
  makeFile,
  moveFile,
  makeFilePlayer,
};
