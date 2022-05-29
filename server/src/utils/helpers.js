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
  let freeTransers = activeTeam.freeTransfers;
  let transfersMade = 0;

  // Check if wildcard or free hit chips are active
  if (incomingTeam.activeChip === "WC" || incomingTeam.activeChip === "FH")
    deduction = 0;
  else {
    // Loop over playerIds of incomingTeam
    for (const playerId of Object.keys(incomingTeam.players)) {
      // Check if the playerIds are in the activeTeam
      if (!activeTeam.players.has(playerId)) {
        deduction += 4;
        transfersMade += 1;
      }
      // If not deduct 4 points
    }

    // Use free transfers if any
    deduction -= 4 * activeTeam.freeTransfers;

    if (freeTransers > 0) {
      freeTransers = freeTransers - 1;
    }
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
  if (!activePlayer.score[gameweekId - 1]) {
    const score = {
      gameweekId,
      price: 0,
      fantasyScore: 0,
      minutesPlayed: 0,
      goals: 0,
      assists: 0,
      cleanSheet: 0,
      yellows: 0,
      reds: 0,
      penalitiesMissed: 0,
      penalitiesSaved: 0,
      saves: 0,
      ownGoal: 0,
      transfersIn: 0,
      transfersOut: 0,
      form: 0,
    };
    activePlayer.score.push(score);
  }

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
    cleanSheet: {
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

  const playerId = activePlayer.playerId;

  for (const statType in compatFixture) {
    activeMatch.matchStat[statType][playerId] =
      compatFixture[statType][playerId];
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

// Function to calculate score
const sumEplPlayerScore = (scoreArr) => {
  let finalSum = 0;

  if (scoreArr.length <= 0) {
    return finalSum;
  } else {
    scoreArr.forEach((score) => {
      finalSum = finalSum + score.fantasyScore;
    });
  }

  return finalSum;
};

module.exports = {
  generateJWTToken,
  pointDeductor,
  statUpdater,
  makeFile,
  moveFile,
  makeFilePlayer,
  // new
  sumEplPlayerScore,
};
