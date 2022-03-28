const expressAsyncHandler = require("express-async-handler");
const JWT = require("jsonwebtoken");

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
const statUpdater = ({ activeMatch, incomingUpdate }) => {
  const {
    minutesPlayed,
    goalsScored,
    assists,
    yellows,
    reds,
    penaltiesMissed,
    penaltiesSaved,
    saves,
    fantasyScores,
  } = incomingUpdate;

  for (const position in activeMatch.homeTeamLineUp.lineup) {
    if (position === "on") break;
    for (const playerId of activeMatch.homeTeamLineUp.lineup[position]) {
      activeMatch.matchStat.minutesPlayed[playerId] =
        minutesPlayed && playerId in minutesPlayed
          ? minutesPlayed[playerId]
          : null ?? activeMatch.matchStat.minutesPlayed[playerId] ?? {};

      activeMatch.matchStat.goalsScored[playerId] =
        goalsScored && playerId in goalsScored
          ? goalsScored[playerId]
          : null ?? activeMatch.matchStat.goalsScored[playerId] ?? {};

      activeMatch.matchStat.assists[playerId] =
        assists && playerId in assists
          ? assists[playerId]
          : null ?? activeMatch.matchStat.assists[playerId] ?? {};

      activeMatch.matchStat.yellows[playerId] =
        yellows && playerId in yellows
          ? yellows[playerId]
          : null ?? activeMatch.matchStat.yellows[playerId] ?? {};

      activeMatch.matchStat.reds[playerId] =
        reds && playerId in reds
          ? reds[playerId]
          : null ?? activeMatch.matchStat.reds[playerId] ?? {};

      activeMatch.matchStat.penaltiesMissed[playerId] =
        penaltiesMissed && playerId in penaltiesMissed
          ? penaltiesMissed[playerId]
          : null ?? activeMatch.matchStat.penaltiesMissed[playerId] ?? {};

      activeMatch.matchStat.penaltiesSaved[playerId] =
        penaltiesSaved && playerId in penaltiesSaved
          ? penaltiesSaved[playerId]
          : null ?? activeMatch.matchStat.penaltiesSaved[playerId] ?? {};

      activeMatch.matchStat.saves[playerId] =
        saves && playerId in saves
          ? saves[playerId]
          : null ?? activeMatch.matchStat.saves[playerId] ?? {};

      activeMatch.matchStat.fantasyScores[playerId] =
        fantasyScores && playerId in fantasyScores
          ? fantasyScores[playerId]
          : null ?? activeMatch.matchStat.fantasyScores[playerId] ?? {};
    }
  }

  for (const position in activeMatch.awayTeamLineUp.lineup) {
    if (position === "on") break;
    for (const playerId of activeMatch.awayTeamLineUp.lineup[position]) {
      activeMatch.matchStat.minutesPlayed[playerId] =
        minutesPlayed && playerId in minutesPlayed
          ? minutesPlayed[playerId]
          : null ?? activeMatch.matchStat.minutesPlayed[playerId] ?? {};

      activeMatch.matchStat.goalsScored[playerId] =
        goalsScored && playerId in goalsScored
          ? goalsScored[playerId]
          : null ?? activeMatch.matchStat.goalsScored[playerId] ?? {};

      activeMatch.matchStat.assists[playerId] =
        assists && playerId in assists
          ? assists[playerId]
          : null ?? activeMatch.matchStat.assists[playerId] ?? {};

      activeMatch.matchStat.yellows[playerId] =
        yellows && playerId in yellows
          ? yellows[playerId]
          : null ?? activeMatch.matchStat.yellows[playerId] ?? {};

      activeMatch.matchStat.reds[playerId] =
        reds && playerId in reds
          ? reds[playerId]
          : null ?? activeMatch.matchStat.reds[playerId] ?? {};

      activeMatch.matchStat.penaltiesMissed[playerId] =
        penaltiesMissed && playerId in penaltiesMissed
          ? penaltiesMissed[playerId]
          : null ?? activeMatch.matchStat.penaltiesMissed[playerId] ?? {};

      activeMatch.matchStat.penaltiesSaved[playerId] =
        penaltiesSaved && playerId in penaltiesSaved
          ? penaltiesSaved[playerId]
          : null ?? activeMatch.matchStat.penaltiesSaved[playerId] ?? {};

      activeMatch.matchStat.saves[playerId] =
        saves && playerId in saves
          ? saves[playerId]
          : null ?? activeMatch.matchStat.saves[playerId] ?? {};

      activeMatch.matchStat.fantasyScores[playerId] =
        fantasyScores && playerId in fantasyScores
          ? fantasyScores[playerId]
          : null ?? activeMatch.matchStat.fantasyScores[playerId] ?? {};
    }
  }

  return activeMatch;
};

module.exports = {
  generateJWTToken,
  pointDeductor,
  statUpdater,
};
