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
  });

  test("GET /eplStats/goals", async () => {
    const expectedResult = [
      { name: "Kicker", goals: 6 },
      { name: "Keeper", goals: 1 },
      { name: "Not Kicker", goals: 1 },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/goals");

    // Expect response
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/assists", async () => {
    const expectedResult = [
      { name: "Not Kicker", assists: 3 },
      { name: "Keeper", assists: 0 },
      { name: "Kicker", assists: 0 },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/assists");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/cleanSheets", async () => {
    const expectedResult = [
      { name: "Keeper", cleanSheets: 0 },
      { name: "Kicker", cleanSheets: 0 },
      {
        name: "Not Kicker",
        cleanSheets: 0,
      },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/cleanSheets");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/reds", async () => {
    const expectedResult = [
      { name: "Kicker", reds: 1 },
      { name: "Keeper", reds: 0 },
      { name: "Not Kicker", reds: 0 },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/reds");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/yellows", async () => {
    const expectedResult = [
      { name: "Keeper", yellows: 0 },
      { name: "Kicker", yellows: 0 },
      { name: "Not Kicker", yellows: 0 },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/yellows");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/saves", async () => {
    const expectedResult = [
      { name: "Keeper", saves: 3 },
      { name: "Kicker", saves: 0 },
      { name: "Not Kicker", saves: 0 },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/saves");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("GET /eplStats/minutesPlayed", async () => {
    const expectedResult = [
      {
        name: "Keeper",
        minutesPlayed: 90,
      },
      { name: "Kicker", minutesPlayed: 0 },
      {
        name: "Not Kicker",
        minutesPlayed: 0,
      },
    ];
    // Clear DB
    await Player.deleteMany();

    // Populate DB
    await populate.addTestPlayer();

    // Send request
    const res = await req.get("/eplStats/minutesPlayed");

    // Expect response
    console.log(res.body);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(expectedResult);
  });

  test("Close DB", async () => {
    // Close DB connection
    mongoose.connection.close();
  });
});
