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
};

module.exports = {
  addTestUser,
};
