const Player = require("../models/Player2");

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

const User = require("../models/User");

const addTestUser = async () => {
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
          100: {
            playerId: "100",
            multiplier: "1",
          },
          200: {
            playerId: "200",
            multiplier: "1",
          },
          300: {
            playerId: "300",
            multiplier: "1",
          },
        },
      },
    ],
  });

  await testUser.save();
  await testPlayer1.save();
  await testPlayer2.save();
  await testPlayer3.save();
};

module.exports = {
  addTestUser,
  addTestPlayer,
};
