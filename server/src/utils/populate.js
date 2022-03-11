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
      },
    ],
  });

  const testPlayer2 = new Player({
    name: "Not Kicker",
    score: [
      {
        gameweekId: 1,
        goals: 0,
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

  await testPlayer1.save();
  await testPlayer2.save();
};

module.exports = {
  addTestPlayer,
};
