const Player = require("../models/Player2");
const User = require("../models/User");
const Gameweek = require("../models/Gameweek2");

const addTestPlayer = async () => {
  // Test PLAYER
  const testPlayer1 = new Player({
    name: "Kicker",
    score: [
      {
        gameweekId: 1,
        goals: 2,
      },
      {
        gameweekId: 2,
        goals: 2,
      },
      {
        gameweekId: 3,
        goals: 2,
        reds: 1,
      },
    ],
  });

  const testPlayer2 = new Player({
    name: "Not Kicker",
    score: [
      {
        gameweekId: 1,
        goals: 0,
        assists: 3,
      },
      {
        gameweekId: 2,
        goals: 0,
      },
      {
        gameweekId: 3,
        goals: 1,
      },
    ],
  });

  const testPlayer3 = new Player({
    name: "Keeper",
    score: [
      {
        gameweekId: 1,
        goals: 0,
        saves: 3,
      },
      {
        gameweekId: 2,
        goals: 0,
      },
      {
        gameweekId: 3,
        goals: 1,
        minutesPlayed: 90,
      },
    ],
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
    number: 1,
    status: "active",
  });

  await testGameweek.save();
};

module.exports = {
  addTestUser,
  addTestGameweek,
  addTestPlayer,
};
