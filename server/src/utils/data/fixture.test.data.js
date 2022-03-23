const reqBody = {
  gameweekId: 4,
  matchId: "2|5",
  schedule: new Date(),
  status: "scheduled",
  homeTeam: "Addis Ababa City",
  awayTeam: "Dire Dawa",
  homeTeamLineUp: {
    teamId: 2,
    lineup: {
      goalkeepers: [101],
      defenders: [201, 202, 203, 204],
      midfielders: [301, 302, 303],
      strikers: [401, 402, 403],
      bench: [105, 302, 205, 401, 206, 410, 308],
    },
  },
  awayTeamLineUp: {
    teamId: 5,
    lineup: {
      goalkeepers: [110],
      defenders: [210, 212, 213, 214],
      midfielders: [311, 312, 313],
      strikers: [420, 431, 441],
      bench: [127, 413, 414, 307, 347, 256, 264],
    },
  },
};

const matchId = "2|5";

module.exports = [reqBody, matchId];
