const supertest = require("supertest");
const app = require("../../index");
const populate = require("../utils/populate");
const User = require("../models/User");
const mongoose = require("mongoose");

const req = supertest(app);

describe("Testing user ", () => {
  test("PUT /user/transfer SUCCESS", async () => {
    // Request body
    const reqBody = {
      incomingTeam: {
        activeChip: "FH",
        gameweekId: 1,
        players: {
          101: {
            playerId: "101",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
            isCaptain: true,
          },
          102: {
            playerId: "102",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
            isViceCaptain: true,
          },
          201: {
            playerId: "201",
            eplTeamId: "10",
            price: "5",
            multiplier: "1",
          },
          202: {
            playerId: "202",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          203: {
            playerId: "203",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          204: {
            playerId: "204",
            eplTeamId: "20",
            price: "5",
            multiplier: "1",
          },
          205: {
            playerId: "205",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          301: {
            playerId: "301",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          302: {
            playerId: "302",
            eplTeamId: "30",
            price: "5",
            multiplier: "1",
          },
          303: {
            playerId: "303",
            eplTeamId: "40",
            price: "5",
            multiplier: "1",
          },
          304: {
            playerId: "304",
            eplTeamId: "40",
            price: "5",
            multiplier: "1",
          },
          305: {
            playerId: "305",
            eplTeamId: "40",
            price: "5",
            multiplier: "0",
          },
          401: {
            playerId: "401",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
          402: {
            playerId: "402",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
          403: {
            playerId: "403",
            eplTeamId: "50",
            price: "5",
            multiplier: "0",
          },
        },
      },
    };

    // Clear DB
    await User.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    console.log(res);
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject({ message: "Successfuly saved team" });
  });
  // test("GET /user/transfer ERROR", async () => {});
  // test("GET /user/transfer ERROR", async () => {});

  test("Close DB", async () => {
    mongoose.connection.close();
  });
});
