const supertest = require("supertest");
const mongoose = require("mongoose");
const app = require("../../index");
const User = require("../models/User");
const Gameweek = require("../models/GameWeek");
const populate = require("../utils/populate");

const req = supertest(app);

describe("Testing User ", () => {
  test("POST /user/register SUCCESS", async () => {
    const reqBody = {
      userName: "wechdad",
      email: "chatadgaeonia@gmail.com",
      password: "12345679@gAl",
      teamName: "arrimish",
      country: "bEthiopia",
    };
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send(reqBody);

    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  test("POST /user/login SUCCESS", async () => {
    const reqBody = {
      email: "chatadgaeonia@gmail.com",
      password: "12345679@gAl",
    };

    // clear db
    // await User.deleteMany();

    // send request
    const res = await req.post("/user/login").send(reqBody);

    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  test("POST /user/login ERROR", async () => {
    const reqBody = {
      email: "fhatadgaeonia@gmail.com",
      password: "12345679@gAl",
    };

    // clear db
    // await User.deleteMany();

    // send request
    const res = await req.post("/user/login").send(reqBody);

    // expect response
    expect(res.statusCode).toBe(400);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject({
      message: "invalid email - password combination",
    });
  });

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
    await Gameweek.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject({ message: "Successfuly saved team" });
  });

  test("PUT /user/transfer ERROR:Incomplete Team", async () => {
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
    await Gameweek.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    expect(res.statusCode).toBe(412);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body).toMatchObject({ message: "Incomplete team!" });
  });

  test("PUT /user/transfer ERROR:Three Player Limit", async () => {
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
            eplTeamId: "10",
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
    await Gameweek.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    expect(res.statusCode).toBe(412);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.message).toMatch("Three player limit exceeded");
  });

  test("PUT /user/transfer ERROR:Budget Limit Exceeded", async () => {
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
            price: "500",
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
    await Gameweek.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    expect(res.statusCode).toBe(412);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.message).toMatch("Team budget exceeded over 100");
  });

  test("PUT /user/transfer ERROR:Invalid Active Chip", async () => {
    // Request body
    const reqBody = {
      incomingTeam: {
        activeChip: "FHH",
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
    await Gameweek.deleteMany();

    // Populate DB
    await populate.addTestUser();
    await populate.addTestGameweek();

    // Append userId to request body
    reqBody.userId = String((await User.findOne())._id);

    // Send request
    const res = await req.put("/user/transfer").send(reqBody);

    // Expect response
    expect(res.statusCode).toBe(412);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.message).toMatch("Invalid active chip");
  });

  test("Close DB", async () => {
    mongoose.connection.close();
  });
});
