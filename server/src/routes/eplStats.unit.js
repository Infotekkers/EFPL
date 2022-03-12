const supertest = require("supertest");
const app = require("../../index");
const populate = require("../utils/populate");
const Player = require("../models/Player2");
const mongoose = require("mongoose");

const req = supertest(app);

describe("Testing EPL stats ", () => {
  test("GET /eplStats/overview", async () => {
    const expectedResult = {
      mostGoals: {
        name: "Kicker",
        goals: 6,
        assists: 0,
        cleanSheets: 0,
        reds: 1,
        yellows: 0,
        saves: 0,
        minutesPlayed: 0,
      },
      mostAssists: {
        name: "Not Kicker",
        goals: 1,
        assists: 3,
        cleanSheets: 0,
        reds: 0,
        yellows: 0,
        saves: 0,
        minutesPlayed: 0,
      },
      mostCleanSheets: {
        name: "Not Kicker",
        goals: 1,
        assists: 3,
        cleanSheets: 0,
        reds: 0,
        yellows: 0,
        saves: 0,
        minutesPlayed: 0,
      },
      mostReds: {
        name: "Kicker",
        goals: 6,
        assists: 0,
        cleanSheets: 0,
        reds: 1,
        yellows: 0,
        saves: 0,
        minutesPlayed: 0,
      },
      mostYellows: {
        name: "Kicker",
        goals: 6,
        assists: 0,
        cleanSheets: 0,
        reds: 1,
        yellows: 0,
        saves: 0,
        minutesPlayed: 0,
      },
      mostSaves: {
        name: "Keeper",
        goals: 1,
        assists: 0,
        cleanSheets: 0,
        reds: 0,
        yellows: 0,
        saves: 3,
        minutesPlayed: 90,
      },
      mostMinutesPlayed: {
        name: "Keeper",
        goals: 1,
        assists: 0,
        cleanSheets: 0,
        reds: 0,
        yellows: 0,
        saves: 3,
        minutesPlayed: 90,
      },
    };

    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/overview");

    // Expect response
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
    mongoose.connection.close();
  });
});
