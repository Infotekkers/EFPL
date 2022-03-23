const supertest = require("supertest");
const app = require("../../index");

const TeamModel = require("../models/Teams");
const mongoose = require("mongoose");

const { teamData } = require("../utils/data/teams.data");
const req = supertest(app);

describe("Testing teams", () => {
  afterAll(() => {
    mongoose.connection.close();
  });

  beforeAll(async () => {
    await TeamModel.deleteMany();
  });

  // Add teams test success
  test("POST /teams/ SUCCESS: Team added Successfully ", async () => {
    // send request

    await TeamModel.deleteMany();
    const res = await req.post(`/teams/`).send({
      teamName: teamData[0],
    });
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`${teamData[0]} added Successfully `);
  });

  // update teams test success
  test("PATCH /teams/:teamId SUCCESS", async () => {
    // send request
    const res = await req.patch(`/teams/1`).send({
      teamName: teamData[0],
    });
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`${teamData[0]} Info updated Successfully `);
  });

  // Add score test success
  test("PATCH /teams/:teamId SUCCESS", async () => {
    // send request
    const res = await req.delete(`/teams/1`);
    // expect response
    expect(res.statusCode).toBe(204);
    // expect(res.text).toBe(`Team is removed.`);
  });
});
