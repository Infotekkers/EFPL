const mongoose = require("mongoose");

const Fixture = require("../models/fixtures");

async function dbConnect() {
  await mongoose.connect("mongodb://localhost:27017/EFPL");
}

dbConnect().then(() => console.log("Database connected"));

new Fixture({
  gameweekId: 1,
  matchId: "12v13",
  schedule: new Date(),
  status: "FT",
  homeTeam: {
    teamId: 12,
    lineup: {
      goalkeepers: [1, 2, 3],
      defenders: [11, 12, 13],
      midfielders: [21, 22, 23],
      strikers: [31, 32, 33],
      bench: [41, 42, 43],
    },
  },
  awayTeam: {
    teamId: 13,
    lineup: {
      goalkeepers: [1, 2, 3],
      defenders: [11, 12, 13],
      midfielders: [21, 22, 23],
      strikers: [31, 32, 33],
      bench: [41, 42, 43],
    },
  },
}).save();
