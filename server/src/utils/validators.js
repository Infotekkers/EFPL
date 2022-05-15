// TODO: Check if multipliers are valid
const validateTeam = (team, availableChips) => {
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

    if (playerId[0] === "1") positionCounter.gk += 1;
    else if (playerId[0] === "2") positionCounter.def += 1;
    else if (playerId[0] === "3") positionCounter.mid += 1;
    else if (playerId[0] === "4") positionCounter.att += 1;

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
  if (
    availableChips.includes(team.activeChip) !== true &&
    team.activeChip !== ""
  )
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

module.exports = {
  validateTeam,
};
