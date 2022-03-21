const Player = require("../models/Player");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const { printConsole } = require("./development");

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
    userName: "Testy",
    password: "Tester@123456",
    email: "tester@testy.com",
    teamName: "The Testies",
    country: "ET",
    favouriteEplTeam: "",
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
};

const addTestGameweek = async () => {
  // Test Gameweek
  const testGameweek = new Gameweek({
    gameWeekNumber: 1,
    startTimestamp: 1647595217,
    status: "Active",
  });

  await testGameweek.save();
};

/*
  ===============================================================
  Populate
  ===============================================================
*/
const populateGameWeeks = async () => {
  // Check game weeks
  const gameWeeks = await axios.get(`${baseURL}${PORT}/gameWeek/info/all`);

  // if no game week
  if (gameWeeks.data.length === 0) {
    let gameWeekDate = 604800;
    let gameWeekStatus = "Active";
    for (let i = 1; i <= 30; i++) {
      gameWeekDate = gameWeekDate + 604800;
      i === 1 ? (gameWeekStatus = "Active") : (gameWeekStatus = "ToBePlayed");
      axios.post(`${baseURL}${PORT}/gameWeek/dev/add`, {
        newGameWeekData: {
          gameWeekNumber: i,
          startTimestamp: gameWeekDate,
          status: gameWeekStatus,
        },
      });
    }
    printConsole(
      { data: "All Game weeks added properly" },
      { printLocation: "populate.js:218" },
      { textColor: "black" },
      { bgColor: "bgGreen" }
    );
  }

  // if incomplete gameweek
  else if (gameWeeks.data.length < 30) {
    await axios.delete(`${baseURL}${PORT}/gameWeek/dev/add`);
    let gameWeekDate = 604800;
    let gameWeekStatus = "Active";
    for (let i = 1; i <= 30; i++) {
      gameWeekDate = gameWeekDate + 604800;
      i === 1 ? (gameWeekStatus = "Active") : (gameWeekStatus = "ToBePlayed");
      axios.post(`${baseURL}${PORT}/gameWeek/dev/add`, {
        newGameWeekData: {
          gameWeekNumber: i,
          startTimestamp: gameWeekDate,
          status: gameWeekStatus,
        },
      });
    }
    printConsole(
      { data: "All Game weeks added properly" },
      { printLocation: "populate.js:218" },
      { bgColor: "bgGreen", textColor: "black" }
    );
  } else {
    printConsole(
      { data: "Gameweek already populated" },
      { printLocation: "populate.js:218" },

      { bgColor: "bgGreen", textColor: "black" }
    );
  }

  // else if(gameWeeks.d)
};

module.exports = {
  addTestUser,
  addTestGameweek,
  addTestPlayer,

  // Scripts
  populateGameWeeks,
};
