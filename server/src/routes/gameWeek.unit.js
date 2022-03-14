const supertest = require("supertest");
const app = require("../../index");
const GameWeek = require("../models/GameWeek");
const mongoose = require("mongoose");

const req = supertest(app);

afterAll(async () => {
  await GameWeek.deleteMany();
  mongoose.connection.close();
});
describe("Testing Game week routes ", () => {
  let game_week_id;
  const data = {
    gameWeekNumber: 2,
    startTimestamp: 1646724092556,
    status: "Active",
  };

  //   Add new game week - Error Scenario
  test("POST /gameWeek/dev/add --Error", async () => {
    // Clear DB
    await GameWeek.deleteMany();

    // Send request
    const res = await req.post("/gameWeek/dev/add").send({
      new_game_week_data: {
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
      new_game_week_data: data,
    });

    game_week_id = res.body._id;

    // Expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(data);
  });

  //   Get Game week by id - Success Scenario
  test("GET /gameWeek/info/id/:ID", async () => {
    // Send request
    const res = await req.get(`/gameWeek/info/id/${game_week_id}`);

    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject(data);
  });

  //   Get Game week by id - Error Scenario
  test("GET /gameWeek/info/id/:ID", async () => {
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
  test("PATCH /update/status/id/:Id", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/status/id/${game_week_id}`)
      .send({
        update_info: {
          status: "TBD",
        },
      });
    // console.log(res);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.status).toBe("TBD");
  });

  //   Update game week status - Error Scenario
  test("PATCH /update/status/id/:Id", async () => {
    console.log(game_week_id);
    // Send request
    const res = await req
      .patch(`/gameWeek/update/status/id/${game_week_id}`)
      .send({
        update_info: {
          status: "NOTValid",
        },
      });
    // console.log(res);
    expect(res.statusCode).toBe(422);
  });

  //   Update Deadline - Error Scenario
  test("PATCH /update/deadline/id/:Id", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/deadline/id/${game_week_id}`)
      .send({
        update_info: {
          startTimestamp: "",
        },
      });
    // console.log(res);
    expect(res.statusCode).toBe(422);
  });

  //   Update Deadline - Success Scenario
  test("PATCH /update/deadline/id/:Id", async () => {
    // Send request
    const res = await req
      .patch(`/gameWeek/update/deadline/id/${game_week_id}`)
      .send({
        update_info: {
          startTimestamp: "160",
        },
      });
    // console.log(res);
    expect(res.statusCode).toBe(200);
  });

  //   Add new game week - Error Scenario
  test("POST /gameWeek/dev/add --Error", async () => {
    // Send request
    const res = await req.post("/gameWeek/dev/add").send({
      new_game_week_data: data,
    });

    game_week_id = res.body._id;

    // Expect response
    expect(res.statusCode).toBe(422);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });
});
