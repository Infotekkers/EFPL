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

const fixtureData = [
  // GameWeek 1
  {
    gameweekId: "1",
    homeTeam: "Saint George",
    awayTeam: "Welayta Dicha",
    schedule: "03-23-22 16:00",
  },
  {
    gameweekId: "1",
    homeTeam: "Hawassa",
    awayTeam: "Fasil Ketema",
    schedule: "03-23-22 17:00",
  },
  {
    gameweekId: "1",
    homeTeam: "Sidama Coffee",
    awayTeam: "Adama City",
    schedule: "03-23-22 18:00",
  },
  {
    gameweekId: "1",
    homeTeam: "Bahir Dar Kenema",
    awayTeam: "Ethiopian Coffee",
    schedule: "03-24-22 17:00",
  },

  // GameWeek 2
  {
    gameweekId: "2",
    homeTeam: "Saint George",
    awayTeam: "Fasil Ketema",
    schedule: "03-30-22 16:00",
  },
  {
    gameweekId: "2",
    homeTeam: "Hawassa",
    awayTeam: "Welayta Dicha",
    schedule: "03-30-22 17:00",
  },
  {
    gameweekId: "2",
    homeTeam: "Sidama Coffee",
    awayTeam: "Ethiopian Coffee",

    schedule: "03-30-22 18:00",
  },
  {
    gameweekId: "2",
    homeTeam: "Bahir Dar Kenema",
    awayTeam: "Adama City",
    schedule: "04-01-22 17:00",
  },
  // GameWeek 3
  {
    gameweekId: "3",
    homeTeam: "Hawassa",
    awayTeam: "Welayta Dicha",
    schedule: "04-08-22 15:00",
  },
  {
    gameweekId: "3",
    homeTeam: "Saint George",
    awayTeam: "Fasil Ketema",
    schedule: "04-08-22 16:00",
  },
  {
    gameweekId: "3",
    homeTeam: "Dire Dawa Kenema",
    awayTeam: "Adama City",
    schedule: "04-10-22 16:00",
  },
  {
    gameweekId: "3",
    homeTeam: "Jimma Kenema",
    awayTeam: "Ethiopian Coffee",
    schedule: "04-10-22 20:00",
  },
  // GameWeek 4
  {
    gameweekId: "4",
    homeTeam: "Hawassa",
    awayTeam: "Sebeta City",
    schedule: "04-16-22 15:30",
  },
  {
    gameweekId: "4",
    homeTeam: "Saint George",
    awayTeam: "Defence Force",
    schedule: "04-16-22 18:30",
  },
  {
    gameweekId: "4",
    homeTeam: "Dire Dawa Kenema",
    awayTeam: "Arba Minch",
    schedule: "04-16-22 18:30",
  },
  {
    gameweekId: "4",
    homeTeam: "Hadiya Hossana",
    awayTeam: "Ethiopian Coffee",
    schedule: "04-18-22 20:00",
  },
  // GameWeek 5
  {
    gameweekId: "5",
    homeTeam: "Bahir Dar Kenema",
    awayTeam: "Sebeta City",
    schedule: "04-16-22 15:30",
  },
  {
    gameweekId: "5",
    homeTeam: "Defence Force",
    awayTeam: "Addis Ababa City",
    schedule: "04-30-22 20:15",
  },
  {
    gameweekId: "5",
    homeTeam: "Wolkite Ketema",
    awayTeam: "Fasil Ketema",
    schedule: "04-30-22 20:15",
  },
  {
    gameweekId: "5",
    homeTeam: "Jimma Kenema",
    awayTeam: "Saint George",
    schedule: "04-30-22 20:15",
  },
];

module.exports = { reqBody, matchId, fixtureData };
