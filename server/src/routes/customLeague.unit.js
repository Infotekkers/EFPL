const supertest = require("supertest");
const app = require("../../index");

const mongoose = require("mongoose");
const CustomLeagueModel = require("../models/CustomLeague");
const { bkConnection } = require("../models/Backup");

// Test data import
const {
  alissonWonderland,
  willianDollarBaby,
} = require("../utils/data/customleagues.test.data");

const req = supertest(app);

describe("League admin functions", () => {
  afterAll(async () => {
    await CustomLeagueModel.deleteMany({});
    bkConnection.close();
  });

  test("POST /customLeagues/create Success: Custom League Created.🟢", async () => {
    const res = await req.post("/customLeagues/create").send(alissonWonderland);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe(
      `Custom league '${alissonWonderland.leagueName}' created!`
    );
  });

  test("POST /customLeagues/remove Error: Custom League doesn't exist.🔴", async () => {
    // For remove player tests
    const customLeague = await CustomLeagueModel.findOne({});
    const playerId = 69420;

    customLeague.teams.push(playerId);
    await customLeague.save();

    const res = await req.post("/customLeagues/remove").send({
      adminId: 123,
      playerId,
      leagueId: 2000001,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe(
      "Couldn't find a custom league with the provided ID!"
    );
  });

  test("POST /customLeagues/remove Error: Unauthorized.🔴", async () => {
    const res = await req.post("/customLeagues/remove").send({
      adminId: 0,
      playerId: 69420,
      leagueId: 1000001,
    });

    expect(res.statusCode).toBe(401);
    expect(res.text).toBe("Unauthorized!");
  });

  test("POST /customLeagues/remove Success: Player successfully removed!🟢", async () => {
    const res = await req.post("/customLeagues/remove").send({
      ...alissonWonderland,
      leagueId: 1000001,
      playerId: 69420,
    });

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Player successfully removed!");
  });

  test("POST /customLeagues/remove Error: Player not a member of Custom League.🔴", async () => {
    // Player removed in previous test

    const res = await req.post("/customLeagues/remove").send({
      ...alissonWonderland,
      leagueId: 1000001,
      playerId: 69420,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Player is not a member of this custom league!");
  });

  test("DELETE /customLeagues/delete Error: Unauthorized!🔴", async () => {
    const res = await req.delete("/customLeagues/delete").send({
      leagueId: 1000001,
      adminId: 0,
    });

    expect(res.statusCode).toBe(401);
    expect(res.text).toBe("Unauthorized!");
  });

  test("DELETE /customLeagues/delete Success: Custom League Deleted.🟢", async () => {
    const res = await req.delete("/customLeagues/delete").send({
      ...alissonWonderland,
      leagueId: 1000001,
    });

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe(
      `Custom league ${alissonWonderland.leagueName} has successfully been deleted!`
    );
  });

  test("DELETE /customLeagues/delete Error: Custom League doesn't exist.🔴", async () => {
    const res = await req.delete("/customLeagues/delete").send({
      ...alissonWonderland, // Deleted in previous test
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe(
      "Couldn't find a custom league with the provided ID!"
    );
  });
});

describe("League member functions", () => {
  beforeAll(async () => {
    await new CustomLeagueModel(alissonWonderland).save();
    await new CustomLeagueModel(willianDollarBaby).save();
  });

  afterAll(async () => {
    await CustomLeagueModel.deleteMany({});
    mongoose.connection.close();
  });

  test("POST /customLeagues/join Success: Join 📢 Public Custom League.🟢", async () => {
    const res = await req.post("/customLeagues/join").send({
      leagueId: 1000001, // alissonwonderland
      playerId: 69420,
    });

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe(
      `Successfully joined ${alissonWonderland.leagueName}!`
    );
  });

  test("POST /customLeagues/join Error: Player already a member of Custom League.🔴", async () => {
    const res = await req.post("/customLeagues/join").send({
      leagueId: 1000001, // alissonwonderland
      playerId: 69420,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Player is already a member of the custom league!");
  });

  test("POST /customLeagues/join Error: Custom League doesn't exist.🔴", async () => {
    const res = await req.post("/customLeagues/join").send({
      leagueId: 100, // League IDs start from 1000001
      playerId: 69420,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe(
      "Couldn't find a custom league with the provided ID!"
    );
  });

  test("POST /customLeagues/join Success: Join 🔒 Private Custom League.🟢", async () => {
    const willianDollarBabyFromDB = await CustomLeagueModel.findOne({
      leagueId: 1000002,
    });

    const res = await req.post("/customLeagues/join").send({
      leagueId: 1000002, // williandollarbaby
      playerId: 69420,
      leagueCode: willianDollarBabyFromDB.leagueCode,
    });

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe(
      `Successfully joined ${willianDollarBaby.leagueName}!`
    );
  });

  test("POST /customLeagues/join Error: Player already a member of 🔒 Private Custom League.🔴", async () => {
    const willianDollarBabyFromDB = await CustomLeagueModel.findOne({
      leagueId: 1000002,
    });

    const res = await req.post("/customLeagues/join").send({
      leagueId: 1000002, // williandollarbaby
      playerId: 69420,
      leagueCode: willianDollarBabyFromDB.leagueCode,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Player is already a member of the custom league!");
  });

  test("POST /customLeagues/join Error: Incorrect 🔒 Private Custom League Code.🔴", async () => {
    const res = await req.post("/customLeagues/join").send({
      leagueId: 1000002, // williandollarbaby
      playerId: 42069,
      leagueCode: "williandollarbaby", // Incorrect
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Incorrect league code!");
  });

  test("POST /customLeagues/leave Success: Leave Custom League.🟢", async () => {
    const res = await req.post("/customLeagues/leave").send({
      leagueId: 1000002,
      playerId: 69420,
    });

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe(`Successfully left ${willianDollarBaby.leagueName}!`);
  });

  test("POST /customLeagues/leave Error: Player not a member of Custom League.🔴", async () => {
    // Player has left custom league in the previous test

    const res = await req.post("/customLeagues/leave").send({
      leagueId: 1000002,
      playerId: 69420,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Player is not a member of this custom league!");
  });

  test("POST /customLeagues/leave Error: Custom League doesn't exist.🔴", async () => {
    const res = await req.post("/customLeagues/leave").send({
      leagueId: 100, // League IDs start from 1000001
      playerId: 69420,
    });

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe(
      "Couldn't find a custom league with the provided ID!"
    );
  });
});
