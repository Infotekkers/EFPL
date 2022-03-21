const supertest = require("supertest");
const app = require("../../index");

const PlayerModel = require("../models/Players");
const mongoose = require("mongoose");

const [
  reqaddPlayer,
  reqaddScore,
  requpdatePlayer,
  requpdateScore, // eslint-disable-line
  gameweekId, // eslint-disable-line
  playerId,
] = require("../utils/players.test.data");
const req = supertest(app);

describe("Testing Players", () => {
  // Add players test success
  test("POST /players/addplayer SUCCESS: Player added Successfully ", async () => {
    // send request

    await PlayerModel.deleteMany();
    const res = await req.post(`/players/addplayer`).send(reqaddPlayer);
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`${reqaddPlayer.playerName} added successfully`);
  });

  // update players test success
  test("PATCH /players/updateplayer/:playerId SUCCESS", async () => {
    // send request
    const res = await req
      .patch(`/players/updateplayer/${playerId}`)
      .send(requpdatePlayer);
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`Info updated successful`);
  });

  // update score test success
  // test("PATCH /players/updatescore/:playerId/:gameweekId SUCCESS", async()=>{
  //     // send request
  //     const res = await req.patch(`/players/updatescore/${playerId}/${gameweekId}`).send(requpdateScore);
  //     // expect response
  //     expect(res.statusCode).toBe(201);
  //     expect(res.text).toBe(`Score for Gameweek update successful`);

  // });

  // Add score test success
  test("PATCH /players/addscore/:playerId SUCCESS", async () => {
    // send request
    const res = await req
      .patch(`/players/addscore/${playerId}`)
      .send(reqaddScore);
    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.text).toBe(`Score added successfully`);
  });
  test("Close DB", async () => {
    mongoose.connection.close();
  });
});
