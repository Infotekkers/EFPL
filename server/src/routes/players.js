const supertest = require("supertest");
const mongoose = require("mongoose");
const app = require("../../index");
const Player = require("../models/Player");
// const Gameweek = require("../models/GameWeek");
// const populate = require("../utils/populate");
const { bkConnection } = require("../models/Backup");
const req = supertest(app);

const dataModel = require("../utils/players.test.data");

describe("Testing User Routes", () => {
  afterAll(() => {
    mongoose.connection.close();
    bkConnection.close();
  });

  /*
    =================================================
    Invalid Player Name
    =================================================
  */

  test("POST /players/addplayer FAIL - Invalid Player Name - Empty", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
    // expect(res.text).toBe(
    //   `${dataModel.playerInfo.playerName} added successfully`
    // );
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Symbol - @", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "@Abebe";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Symbol - <", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "<Abebe";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Symbol - >", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = ">Abebe";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Symbol - >", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "$Abebe";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Short < 4", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "Abe";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Long > 56", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName =
      "Ethiopian Fantasy Premier League Football Club Player Abebe Maru";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Name - Includes Numbers", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.playerName = "Abebe 1";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Player Team
    =================================================
  */
  test("POST /players/addplayer FAIL - Invalid Player Team - No Team", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.eplTeamId = "";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Team - Symbol", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.eplTeamId = "@Saint George";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Price
    =================================================
  */
  test("POST /players/addplayer FAIL - Invalid Player Price - Symbol", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.currentPrice = "@32";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Price < 3.5", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.currentPrice = "3.2";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /players/addplayer FAIL - Invalid Player Price - Text", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.currentPrice = "Player Price";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Player Position
    =================================================
  */
  test("POST /players/addplayer FAIL - Invalid Player Position - Empty", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.position = "";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /players/addplayer FAIL - Invalid Player Position - GKS", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.position = "GKS";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /players/addplayer FAIL - Invalid Player Position - Number", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.position = "12334";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /players/addplayer FAIL - Invalid Player Position - Symbol", async () => {
    // send request
    await Player.deleteMany();
    const info = dataModel.playerInfo;
    info.position = "@GKS";
    const res = await req.post(`/players/addplayer`).send(info);
    // expect response
    expect(res.statusCode).toBe(422);
  });
  /*
    =================================================
    Success
    =================================================
  */
  test("POST /players/addplayer SUCCESS - Register Player", async () => {
    // send request
    await Player.deleteMany();
    const res = await req.post(`/players/addplayer`).send({
      playerName: "Salamlak Tegegn",
      eplTeamId: "Bahir Dar Kenema S.C",
      currentPrice: 4.9,
      position: "DEF",
      availability: {
        injuryStatus: "25",
        injuryMessage: "Shoulder dislocations",
      },
      score: [],
      history: [],
    });
    // expect response
    expect(res.statusCode).toBe(201);
  });

  /*
    =================================================
    Update
    =================================================
  */
  test("POST /players/addplayer SUCCESS - Update Player", async () => {
    // send request
    await Player.deleteMany();
    const res = await req.post(`/players/addplayer`).send({
      playerName: "Salamlak Tegegn",
      eplTeamId: "Bahir Dar Kenema S.C",
      currentPrice: 4.9,
      position: "DEF",
      availability: {
        injuryStatus: "25",
        injuryMessage: "Shoulder dislocations",
      },
      score: [],
      history: [],
    });

    const pid = await Player.findOne({});

    // send request
    const resUpdate = await req
      .patch(`/players/updateplayer/${pid.playerId}`)
      .send({ playerName: "Salamla Tegegn", emitSocket: 0 });
    // expect response
    expect(res.statusCode).toBe(201);

    // expect response
    expect(resUpdate.statusCode).toBe(201);
  });

  //   update score test success
  test("PATCH /players/updatescore/:playerId/:gameweekId SUCCESS - Set Score", async () => {
    // send request
    const pid = await Player.findOne({});
    const res = await req.patch(`/players/updatescore/${pid.playerId}/1`).send({
      score: {
        gameweekId: 1,
        price: 8.0,
        fantasyScore: 4,
        minutesPlayed: 62,
        goals: 0,
        assist: 3,
        cleanSheet: 4,
        yellows: 1,
        reds: 1,
        penalitiesMissed: 1,
        penalitiesSaved: 5,
        saves: 5,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      emitSocket: 0,
    });
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`Score for Gameweek update successful`);
  });
  //   update score test success
  test("PATCH /players/updatescore/:playerId/:gameweekId SUCCESS - Update Score", async () => {
    // send request
    const pid = await Player.findOne({});
    const res = await req.patch(`/players/updatescore/${pid.playerId}/1`).send({
      score: {
        gameweekId: 1,
        price: 8.0,
        fantasyScore: 32,
        minutesPlayed: 62,
        goals: 0,
        assist: 4,
        cleanSheet: 4,
        yellows: 1,
        reds: 1,
        penalitiesMissed: 1,
        penalitiesSaved: 5,
        saves: 5,
        ownGoal: 0,
        transfersIn: 3,
        transfersOut: 3,
        form: 6,
      },
      emitSocket: 0,
    });
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`Score for Gameweek update successful`);
  });
});
