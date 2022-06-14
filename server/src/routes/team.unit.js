const supertest = require("supertest");
const app = require("../../index");

const TeamModel = require("../models/Teams");
const mongoose = require("mongoose");
const { bkConnection } = require("../models/Backup");

const { teamData } = require("../utils/data/teams.data");
const req = supertest(app);

describe("Testing teams", () => {
  afterAll(() => {
    mongoose.connection.close();
    bkConnection.close();
  });

  beforeAll(async () => {
    await TeamModel.deleteMany();
  });

  /*
    =================================================
    Add Team
    =================================================
  */
  // test("POST /teams/ SUCCESS: Team added Successfully ", async () => {
  //   // send request
  //   await TeamModel.deleteMany();
  //   const res = await req.post(`/teams/`).send(teamData[0]);
  //   // expect response
  //   expect(res.statusCode).toBe(201);
  //   expect(res.text).toBe(`${teamData[0].teamName} added Successfully `);
  // });

  /*
    =================================================
    Team Name
    =================================================
  */
  test("POST /teams/ FAIL Team Name Empty", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name Too Long > 72", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName =
      "Ethiopian Fantasy Premier League Team Name Is Too Long to Save to the Database";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name Too Short > 4 ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "Sai";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name has Symbol - @ ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "Saint George F@C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name has Symbol - ! ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "Saint George F!C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name has Symbol - > ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "Saint George F>C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Name has Symbol - < ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamName = "Saint George F<C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Team City
    =================================================
  */
  test("POST /teams/ FAIL Team City Empty", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City Too Long > 72", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity =
      "Ethiopian Fantasy Premier League Team Name Is Too Long to Save to the Database";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City Too Short > 4 ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "Sai";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City has Symbol - @ ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "Saint George F@C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City has Symbol - ! ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "Saint George F!C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City has Symbol - > ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "Saint George F>C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team City has Symbol - < ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamCity = "Saint George F<C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Team Stadium
    =================================================
  */
  test("POST /teams/ FAIL Team Stadium Empty", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium Too Long > 72", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium =
      "Ethiopian Fantasy Premier League Team Name Is Too Long to Save to the Database";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium Too Short > 4 ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "Sai";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium has Symbol - @ ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "Saint George F@C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium has Symbol - ! ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "Saint George F!C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium has Symbol - > ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "Saint George F>C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /teams/ FAIL Team Stadium has Symbol - < ", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.teamStadium = "Saint George F<C";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Team Stadium Capacity
    =================================================
  */
  test("POST /teams/ FAIL Team Stadium Capacity < 0", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.stadiumCapacity = "-32";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Founded
    =================================================
  */
  test("POST /teams/ FAIL Team Founded In < 0", async () => {
    // send request
    await TeamModel.deleteMany();
    const info = teamData[0];
    info.foundedIn = "-32";
    const res = await req.post(`/teams/`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
});
