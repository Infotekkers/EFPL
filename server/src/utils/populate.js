const axios = require("axios");
const baseURL = process.env.BASE_URL;
const { printConsole } = require("./development");

// Import Models
const Player = require("../models/Player");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const Fixture = require("../models/Fixtures");
const Team = require("../models/Teams");
const Admin = require("../models/Admin");

// Import Data
const { teamData } = require("./data/teams.data");
const { playersData } = require("../utils/data/players.data");
const { allPairedMatches } = require("../utils/data/fixture.data");
// const EFPLStats = require("../models/EFPLStats");

const addTestPlayer = async () => {
  // Test PLAYER
  const testPlayer1 = new Player({
    playerName: "Kicker",
    position: "ATT",
    currentPrice: 8.0,
    eplTeamId: "10",
    score: [
      {
        price: 8.0,
        fantasyScore: 0,
        minutesPlayed: 10,
        gameweekId: 1,
        goals: 3,
        assists: 0,
        cleanSheet: 0,
        yellows: 0,
        reds: 0,
        penalitiesMissed: 1,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 10,
        gameweekId: 2,
        goals: 3,
        assists: 0,
        cleanSheet: 0,
        yellows: 0,
        reds: 0,
        penalitiesMissed: 1,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 10,
        gameweekId: 3,
        goals: 3,
        assists: 0,
        cleanSheet: 0,
        yellows: 0,
        reds: 1,
        penalitiesMissed: 1,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
    ],
    availability: {
      injuryStatus: false,
      injuryMessage: "fit to play",
    },
    history: {
      startingPrice: 5.5,
      endingPrice: 7.0,
      totalFantasyScore: 34,
      totalMinutesPlayed: 87,
      totalGoals: 2,
      totalAssists: 3,
      totalCleanSheets: 1,
      totalYellows: 1,
      totalReds: 2,
      totalPenalitiesMissed: 12,
      totalPenalitiesSaved: 11,
      totalSaves: 1,
      totalOwnGoal: 2,
      totalTransfersIn: 3,
      totalTransfersOut: 4,
      totalform: 7,
    },
  });

  const testPlayer2 = new Player({
    playerName: "Not Kicker",
    position: "DEF",
    currentPrice: 9.0,
    eplTeamId: "10",
    score: [
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 20,
        gameweekId: 1,
        goals: 0,
        assists: 3,
        cleanSheet: 1,
        yellows: 2,
        reds: 0,
        penalitiesMissed: 0,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 20,
        gameweekId: 2,
        goals: 0,
        assists: 3,
        cleanSheet: 1,
        yellows: 2,
        reds: 0,
        penalitiesMissed: 0,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 20,
        gameweekId: 3,
        goals: 0,
        assists: 3,
        cleanSheet: 1,
        yellows: 2,
        reds: 0,
        penalitiesMissed: 0,
        penalitiesSaved: 0,
        saves: 0,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
    ],
    availability: {
      injuryStatus: false,
      injuryMessage: "fit to play",
    },
    history: {
      startingPrice: 5.5,
      endingPrice: 7.0,
      totalFantasyScore: 34,
      totalMinutesPlayed: 87,
      totalGoals: 2,
      totalAssists: 3,
      totalCleanSheets: 1,
      totalYellows: 1,
      totalReds: 2,
      totalPenalitiesMissed: 12,
      totalPenalitiesSaved: 11,
      totalSaves: 1,
      totalOwnGoal: 2,
      totalTransfersIn: 3,
      totalTransfersOut: 4,
      totalform: 7,
    },
  });

  const testPlayer3 = new Player({
    playerName: "Keeper",
    position: "GK",
    currentPrice: 9.0,
    eplTeamId: "10",
    score: [
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 90,
        gameweekId: 1,
        goals: 0,
        assists: 0,
        cleanSheet: 4,
        yellows: 1,
        reds: 0,
        penalitiesMissed: 1,
        penalitiesSaved: 5,
        saves: 5,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 90,
        gameweekId: 2,
        goals: 0,
        assists: 0,
        cleanSheet: 4,
        yellows: 1,
        reds: 0,
        penalitiesMissed: 1,
        penalitiesSaved: 5,
        saves: 5,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      {
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 90,
        gameweekId: 3,
        goals: 1,
        assists: 0,
        cleanSheet: 4,
        yellows: 1,
        reds: 1,
        penalitiesMissed: 1,
        penalitiesSaved: 5,
        saves: 5,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
    ],
    availability: {
      injuryStatus: false,
      injuryMessage: "fit to play",
    },
    history: {
      startingPrice: 5.5,
      endingPrice: 7.0,
      totalFantasyScore: 34,
      totalMinutesPlayed: 87,
      totalGoals: 2,
      totalAssists: 3,
      totalCleanSheets: 1,
      totalYellows: 1,
      totalReds: 2,
      totalPenalitiesMissed: 12,
      totalPenalitiesSaved: 11,
      totalSaves: 1,
      totalOwnGoal: 2,
      totalTransfersIn: 3,
      totalTransfersOut: 4,
      totalform: 7,
    },
  });

  await testPlayer1.save();
  await testPlayer2.save();
  await testPlayer3.save();
};

const addTestUser = async () => {
  // Test USER
  const testUser = new User({
    userName: "MaduserYaknow",
    password: "Tester@123456",
    email: "tester@testy.com",
    teamName: "Mad Team Ya know",
    country: "ET",
    favouriteEplTeam: "Buna",
    team: [
      // {
      //   gameweekId: "1",
      //   activeChip: "",
      //   freeTransfers: 1,
      //   deduction: 0,
      //   players: {
      //     101: {
      //       playerId: "100028",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //       isCaptain: true,
      //     },
      //     102: {
      //       playerId: "100002",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //       isViceCaptain: true,
      //     },
      //     201: {
      //       playerId: "100032",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     202: {
      //       playerId: "100009",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     203: {
      //       playerId: "100060",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     204: {
      //       playerId: "100063",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     205: {
      //       playerId: "100116",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     301: {
      //       playerId: "100095",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     302: {
      //       playerId: "100096",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     303: {
      //       playerId: "100174",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     304: {
      //       playerId: "100151",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     305: {
      //       playerId: "100152",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     401: {
      //       playerId: "100184",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     402: {
      //       playerId: "100021",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     403: {
      //       playerId: "100450",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //   },
      // },
      // {
      //   gameweekId: "2",
      //   activeChip: "",
      //   freeTransfers: 1,
      //   deduction: 0,
      //   players: {
      //     101: {
      //       playerId: "100028",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //       isCaptain: true,
      //     },
      //     102: {
      //       playerId: "100002",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //       isViceCaptain: true,
      //     },
      //     201: {
      //       playerId: "100032",
      //       eplTeamId: "10",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     202: {
      //       playerId: "100009",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     203: {
      //       playerId: "100060",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     204: {
      //       playerId: "100063",
      //       eplTeamId: "20",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     205: {
      //       playerId: "100116",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     301: {
      //       playerId: "100095",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     302: {
      //       playerId: "100096",
      //       eplTeamId: "30",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     303: {
      //       playerId: "100174",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     304: {
      //       playerId: "100151",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "1",
      //     },
      //     305: {
      //       playerId: "100152",
      //       eplTeamId: "40",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     401: {
      //       playerId: "100184",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     402: {
      //       playerId: "100021",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //     403: {
      //       playerId: "100450",
      //       eplTeamId: "50",
      //       price: "5",
      //       multiplier: "0",
      //     },
      //   },
      // },
    ],
    maxBudget: 100.0,
  });
  const testUser2 = new User({
    userName: "Test Man 2",
    password: "SoStrong123!!!",
    email: "mikealexiv565@gmail.com",
    teamName: "ChaosServidoras",
    country: "ET",
    favouriteEplTeam: "St.George",
    team: [
      {
        gameweekId: "1",
        players: {
          101: {
            playerId: "101",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
            isCaptain: true,
          },
          102: {
            playerId: "102",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
            isViceCaptain: true,
          },
          201: {
            playerId: "201",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
          },
          202: {
            playerId: "202",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          203: {
            playerId: "203",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          204: {
            playerId: "204",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          205: {
            playerId: "205",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          301: {
            playerId: "301",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          302: {
            playerId: "302",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          303: {
            playerId: "303",
            eplTeamId: "40",
            price: "5",
            multiplier: "1",
          },
          304: {
            playerId: "304",
            eplTeamId: "40",
            price: "5",
            multiplier: "1",
          },
          305: {
            playerId: "305",
            eplTeamId: "40",
            price: "5",
            multiplier: "0",
          },
          401: {
            playerId: "401",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
          402: {
            playerId: "402",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
          403: {
            playerId: "403",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
        },
      },
    ],
  });

  await testUser.save();
  await testUser2.save();
};

const addTestAdmin = async () => {
  const admins = await Admin.find();

  const newAdmins = [
    {
      email: "mikealexiv565@gmail.com",
      password: "Strong@Password123",
    },
    {
      email: "admin@admin.com",
      password: "StrongPass@123",
    },
  ];

  if (admins.length < 2) {
    if (admins.length !== 1) {
      await Admin.deleteMany();
    }

    newAdmins.forEach(async (admin) => {
      await Admin.create(admin);
    });
  }

  printConsole(
    { data: "USERNAME:admin@admin.com PASSWORD:StrongPass@123" },
    { printLocation: "populate.js:218" },
    { bgColor: "bgYellow" }
  );
};

const addTestGameweek = async () => {
  // Test Gameweek
  const testGameweek = new Gameweek({
    gameWeekNumber: 1,
    startTimestamp: 1647595217,
    status: "active",
  });

  await testGameweek.save();
};

const addTestFixture = async () => {
  const testFixture = new Fixture({
    gameweekId: 1,
    matchId: "10|20",
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
        bench: [105, 307, 205, 408, 206, 410, 308],
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
    matchStat: {
      minutesPlayed: {
        101: {
          playerId: 101,
          noOfMinutes: 64,
        },
      },
      goalsScored: {},
      assists: {},
      yellows: {},
      reds: {},
      penaltiesMissed: {},
      penaltiesSaved: {},
      saves: {},
      fantasyScores: {},
    },
  });

  await testFixture.save();
};

/*
  ===============================================================
  Populate
  ===============================================================
*/
const populateTeams = async () => {
  // for (let i = 0; i < 30; i++) {
  //   await EFPLStats.create({
  //     allStats: {
  //       gameWeekNumber: i + 1,
  //       highestPoint: 0,
  //       averagePoint: 0,
  //       mostSelectedPlayer: [],
  //       mostTransferredOutPlayer: [],
  //       transfersMadeCount: 0,
  //       mostCaptainedPlayer: [],
  //       mostViceCaptainedPlayer: [],
  //       benchBoostCount: 0,
  //       freeHitCount: 0,
  //       wildCardCount: 0,
  //       tripleCaptainCount: 0,
  //       dreamTeam: {
  //         goalKeeper: [],
  //         defenders: [],
  //         midfielders: [],
  //         attackers: [],
  //       },
  //     },
  //     gameWeekNumber: i + 1,
  //   });
  // }

  // check teams
  const teams = await axios.get(`${baseURL}/teams/all`);

  // if no teams
  if (teams.data.length === 0) {
    teamData.forEach(async (team) => {
      await Team.create(team);
    });
    printConsole(
      { data: `${teamData.length} teams added.` },
      { printLocation: "populate.js:490" },
      { bgColor: "bgGreen", textColor: "black" }
    );
  } else {
    printConsole(
      { data: "Teams already populated" },
      { printLocation: "populate.js:497" },

      { bgColor: "bgGreen", textColor: "black" }
    );
  }
};

const populatePlayers = async () => {
  const players = await axios.get(`${baseURL}/players/getplayers`);

  // if no players
  if (players.data.data.length === 0) {
    playersData.forEach(async (team) => {
      team.forEach(async (player) => {
        const allScores = [];

        for (let index = 0; index <= 29; index++) {
          allScores.push({
            gameweekId: index + 1,
            price: player.currentPrice,
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
          });
        }
        player.score = allScores;
        await Player.create(player);
      });
    });
    printConsole(
      { data: `${playersData.length * playersData[0].length} players added.` },
      { printLocation: "populate.js:490" },
      { bgColor: "bgGreen", textColor: "black" }
    );
  } else {
    printConsole(
      { data: "Players already populated" },
      { printLocation: "populate.js:497" },

      { bgColor: "bgGreen", textColor: "black" }
    );
  }
};

const populateFixture = async () => {
  await Fixture.deleteMany();
  await Gameweek.deleteMany();
  // all teams and ID
  const teamNameIDPair = {
    "Saint George S.C": "1",
    "Wolaita Dicha S.C": "2",
    "Hawassa Kenema S.C": "3",
    "Fasil Kenema S.C": "4",
    "Adama City S.C": "5",
    "Sidama Coffee S.C": "6",
    "Bahir Dar Kenema S.C": "7",
    "Ethiopian Coffee S.C": "8",
    "Wolkite City F.C": "9",
    "Arba Minch City F.C": "10",
    "Defence Force S.C": "11",
    "Hadiya Hossana F.C": "12",
    "Dire Dawa City S.C": "13",
    "Addis Ababa City F.C": "14",
    "Jimma Aba Jifar F.C": "15",
    "Sebeta City F.C": "16",
  };

  // get all fixtures
  const fixtures = await axios.get(`${baseURL}/fixtures/`);

  //  if no fixtures
  if (fixtures.data.length === 0) {
    for (let i = 0; i < allPairedMatches.length; i++) {
      const multiplier = i + 1;

      const hours = [
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22",
      ];

      const minutes = [
        "00",
        "15",
        "20",
        "25",
        "30",
        "35",
        "40",
        "45",
        "50",
        "55",
      ];

      const currentGameWeek = {
        gameWeekNumber: i + 1,
        startTimestamp: Date.now() + 604800 * i,
        status: "ToBePlayed",
      };
      await Gameweek.create(currentGameWeek);

      let count = 1;

      allPairedMatches[i].forEach(async (fixture) => {
        const homeTeamID = teamNameIDPair[fixture.homeTeam];
        const awayTeamID = teamNameIDPair[fixture.awayTeam];

        const dayDate = new Date();
        dayDate.setDate(dayDate.getDate() + multiplier * 7);

        if (count > 4 && count <= 6) {
          dayDate.setDate(dayDate.getDate() + 1);
        } else if (count === 6) {
          dayDate.setDate(dayDate.getDate() + 2);
        } else if (count === 7) {
          dayDate.setDate(dayDate.getDate() + 3);
        }

        const timeDate =
          hours[Math.floor(Math.random() * hours.length)] +
          ":" +
          minutes[Math.floor(Math.random() * minutes.length)] +
          ":" +
          "00";

        const SCHEDULE = new Date(
          dayDate.toISOString().split("T")[0] + "T" + timeDate
        );

        count = count + 1;

        const currentFixture = {
          gameweekId: currentGameWeek.gameWeekNumber,
          matchId: `${homeTeamID}|${awayTeamID}`,
          schedule: SCHEDULE,

          status: "scheduled",
          homeTeam: fixture.homeTeam,
          awayTeam: fixture.awayTeam,
          // score: [],

          matchStat: {
            minutesPlayed: {},
            goalsScored: {},
            assists: {},
            cleanSheet: {},
            yellows: {},
            reds: {},
            penaltiesMissed: {},
            penaltiesSaved: {},
            saves: {},
            ownGoal: {},
            fantasyScores: {},
          },
        };
        await Fixture.create(currentFixture);
      });
    }
    printConsole(
      { data: `${30 * 8} fixtures added.` },
      { printLocation: "populate.js:524" },
      { bgColor: "bgGreen", textColor: "black" }
    );
  }
  // Incomplete data
  // else if (fixtures.data.length < 240) {
  //   await Gameweek.deleteMany();
  //   await Fixture.deleteMany();

  //   for (let i = 0; i < allPairedMatches.length; i++) {
  //     const currentGameWeek = {
  //       gameWeekNumber: i + 1,
  //       startTimestamp: Date.now() + 604800 * i,
  //       status: "ToBePlayed",
  //     };
  //     await Gameweek.create(currentGameWeek);

  //     allPairedMatches[i].forEach(async (fixture) => {
  //       const homeTeamID = teamNameIDPair[fixture.homeTeam];
  //       const awayTeamID = teamNameIDPair[fixture.awayTeam];

  //       const currentFixture = {
  //         gameweekId: currentGameWeek.gameWeekNumber,
  //         matchId: `${homeTeamID}|${awayTeamID}`,
  //         schedule: Date.now() + 3600,

  //         // Concern Here what are the possible values
  //         status: "scheduled",
  //         homeTeam: fixture.homeTeam,
  //         awayTeam: fixture.awayTeam,
  //       };
  //       await Fixture.create(currentFixture);
  //     });
  //   }

  //   printConsole(
  //     { data: "All Fixtures added properly" },
  //     { printLocation: "populate.js:524" },
  //     { bgColor: "bgGreen", textColor: "black" }
  //   );
  // }
  //  complete data
  else {
    printConsole(
      { data: "Fixtures already populated" },
      { printLocation: "populate.js:532" },
      { bgColor: "bgGreen", textColor: "black" }
    );
  }
};

const pouplateStatsInit = async () => {};
module.exports = {
  addTestUser,
  addTestGameweek,
  addTestPlayer,
  addTestFixture,
  addTestAdmin,

  // Scripts
  populateTeams,
  populatePlayers,
  populateFixture,
  pouplateStatsInit,
};
