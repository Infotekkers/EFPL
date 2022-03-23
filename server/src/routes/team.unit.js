const supertest = require("supertest");
const app = require("../../index");

const TeamModel = require("../models/Teams");
const mongoose = require("mongoose");

const [reqbody, teamId] = require("../utils/teams.test.data");
const req = supertest(app);

describe("Testing teams", () => {
  // Add teams test success
  test("POST /teams/addteam SUCCESS: Team added Successfully ", async () => {
    // send request

    await TeamModel.deleteMany();
    const res = await req.post(`/teams/`).send(reqbody);
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`${reqbody.teamName} added Succesfully `);
  });

  // update teams test success
  test("PATCH /teams/updateteams/:teamId SUCCESS", async () => {
    // send request
    const res = await req.patch(`/teams/updateteam/${teamId}`).send(reqbody);
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`${reqbody.teamName} Info updated Succesfully `);
  });

  // Add score test success
  test("PATCH /teams/deleteteam/:teamId SUCCESS", async () => {
    // send request
    const res = await req.delete(`/teams/deleteteam/${teamId}`);
    // expect response
    expect(res.statusCode).toBe(204);
    // expect(res.text).toBe(`Team is removed.`);
  });

  test("Close DB", async () => {
    mongoose.connection.close();
  });
});
