const supertest = require("supertest");
const app = require("../../index");
const GameWeek = require("../models/GameWeek");
const mongoose = require("mongoose");
const { bkConnection } = require("../models/Backup");

const req = supertest(app);

describe("Testing Game week routes ", () => {
  afterAll(async () => {
    await GameWeek.deleteMany();
    mongoose.connection.close();
    bkConnection.close();
  });
  let gameWeekId;
  const data = {
    gameWeekNumber: 2,
    startTimestamp: 1646724092556,
    status: "Active",
  };

  // Add new game week - Error Scenario
  test("POST /gameWeek/dev/add --Error", async () => {
    // Send request
    const res = await req.post("/gameWeek/dev/add").send({
      newGameWeekData: {
        gameWeekNumber: "",
        startTimestamp: 1646724092556,
        status: "Active",
      },
    });

    // Expect response
    expect(res.statusCode).toBe(422);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  //   Add new game week - Success Scenario
  test("POST /gameWeek/dev/add --Success", async () => {
    // Clear DB
    await GameWeek.deleteMany();

    // Send request
    const res = await req.post("/gameWeek/dev/add").send({
      newGameWeekData: data,
    });

    gameWeekId = res.body._id;

    // Expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(data);
  });

  // Get Game week by id - Success Scenario
  test("GET /gameWeek/info/id/:ID", async () => {
    // Send request
    const res = await req.get(`/gameWeek/info/id/${gameWeekId}`);

    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(data);
  });

  //   Get Game week by id - Error Scenario
  test("GET /gameWeek/info/id/:ID --Error", async () => {
    // Send request
    const res = await req.get(`/gameWeek/info/id/9999`);

    expect(res.statusCode).toBe(422);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  //   Get All game weeks
  test("GET /gameWeek/info/all", async () => {
    // Send request
    const res = await req.get("/gameWeek/info/all");

    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  //   Update game week status - Success Scenario
  test("PATCH /update/status/id/:Id --Success", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/status/id/${gameWeekId}`)
      .send({
        updateInfo: {
          status: "TBD",
        },
      });
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.status).toBe("TBD");
  });

  //   Update game week status - Error Scenario
  test("PATCH /update/status/id/:Id --Error", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/status/id/${gameWeekId}`)
      .send({
        updateInfo: {
          status: "NOTValid",
        },
      });
    expect(res.statusCode).toBe(422);
  });

  //   Update Deadline - Error Scenario
  test("PATCH /update/deadline/id/:Id --Error", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/deadline/id/${gameWeekId}`)
      .send({
        updateInfo: {
          startTimestamp: "",
        },
      });
    expect(res.statusCode).toBe(422);
  });

  //   Update Deadline - Success Scenario
  test("PATCH /update/deadline/id/:Id --Success", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/deadline/id/${gameWeekId}`)
      .send({
        updateInfo: {
          startTimestamp: "160",
        },
      });
    expect(res.statusCode).toBe(200);
  });

  //   Add new game week - Error Scenario
  test("POST /gameWeek/dev/add --Error", async () => {
    // Send request
    const res = await req.post("/gameWeek/dev/add").send({
      newGameWeekData: data,
    });

    gameWeekId = res.body._id;

    // Expect response
    expect(res.statusCode).toBe(422);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });
});
