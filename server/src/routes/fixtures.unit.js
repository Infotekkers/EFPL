const supertest = require("supertest");
const app = require("../../index");

const FixtureModel = require("../models/fixtures");
const mongoose = require("mongoose");

// Test data import
const [reqBody, matchId] = require("../utils/fixture.test.data");

const req = supertest(app);

describe("Fixture status updates", () => {
  beforeAll(async () => {
    await FixtureModel.deleteMany({});
  });

  beforeEach(async () => {
    await new FixtureModel(reqBody).save();
  });

  afterEach(async () => {
    await FixtureModel.findOne({ matchId }).deleteOne();
  });

  /***********************************************************/
  // Start route
  test("PATCH /fixtures/start/:matchId Success: Fixture started.🟢", async () => {
    const res = await req.patch(`/fixtures/start/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Match is live!");
  });

  test("Patch /fixtures/start/:matchId Error: Fixture status not 'scheduled'.🔴", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "liveFH";
    match.save();

    const res = await req.patch(`/fixtures/start/${matchId}`);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Match can't be started!");
  });

  /***********************************************************/
  // Pause route
  test("PATCH /fixtures/pause/:matchId Success: Fixture paused.🟢", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "liveFH";
    match.save();

    const res = await req.patch(`/fixtures/pause/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Half Time!");
  });

  test("Patch /fixtures/pause/:matchId Error: Fixture status not 'liveFH'.🔴", async () => {
    const res = await req.patch(`/fixtures/pause/${matchId}`);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Match hasn't started!");
  });

  /***********************************************************/
  // Resume route
  test("PATCH /fixtures/resume/:matchId Success: Fixture resumed.🟢", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "HT";
    match.save();

    const res = await req.patch(`/fixtures/resume/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Match resumed!");
  });

  test("PATCH /fixtures/resume/:matchId Error: Fixture status not 'HT'.🔴", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "scheduled";
    match.save();

    const res = await req.patch(`/fixtures/resume/${matchId}`);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Match can't be resumed!");
  });

  /***********************************************************/
  // End route
  test("PATCH /fixtures/end/:matchId Success: Fixture ended.🟢", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "liveSH";
    match.save();

    const res = await req.patch(`/fixtures/end/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Full time!");
  });

  test("PATCH /fixtures/end/:matchId Error: Fixture status not 'liveSH'.🔴", async () => {
    const res = await req.patch(`/fixtures/end/${matchId}`);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Match can't be ended!");
  });

  /***********************************************************/
  // Postpone route
  test("PATCH /fixtures/postpone/:matchId Success: Fixture postponed.🟢", async () => {
    const res = await req.patch(`/fixtures/postpone/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Match postponed!");
  });

  test("PATCH /fixtures/end/:matchId Success: Fixture has been started.🔴", async () => {
    const match = await FixtureModel.findOne({ matchId });
    match.status = "liveFH";
    match.save();

    const res = await req.patch(`/fixtures/postpone/${matchId}`);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Match is ongoing!");
  });

  /***********************************************************/
  // Fixture doesn't exist
  test("PATCH /fixtures/(start, pause, resume, postpone))/:matchId Error: Fixture doesn't exist.🔴", async () => {
    let res;

    for (const route of ["start", "pause", "resume", "end", "postpone"]) {
      res = await req.patch(`/fixtures/${route}/<>`);

      expect(res.statusCode).toBe(404);
      expect(res.text).toBe("Match doesn't exist!");
    }
  });
});

describe("Fetch fixtures", () => {
  beforeAll(async () => {
    await FixtureModel.deleteMany({});
    await new FixtureModel(reqBody).save();
  });

  afterAll(async () => {
    await FixtureModel.deleteMany({});
  });

  test("GET /fixtures/ Success: Get all fixtures.🟢", async () => {
    const alternateReqbody = { ...reqBody };
    alternateReqbody.matchId = "4|2";
    await new FixtureModel(alternateReqbody).save();

    const res = await req.get("/fixtures/");

    expect(res.statusCode).toBe(200);
    expect(res.body.length).toEqual(2);
  });

  test("Get /fixtures/:matchId Success: Get specific fixture.🟢", async () => {
    const res = await req.get(`/fixtures/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.body.matchId).toBe(matchId);
  });
});

describe("Fixture add, update, and delete", () => {
  beforeAll(async () => {
    await FixtureModel.deleteMany({});
  });

  afterAll(async () => {
    mongoose.connection.close();
  });

  test("POST /fixtures/add Success: Fixture added to database.🟢", async () => {
    const res = await req.post("/fixtures/add").send(reqBody);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Fixture added!");
  });

  test("POST /fixtures/add Error: Fixture already in Database.🔴", async () => {
    const res = await req.post("/fixtures/add").send(reqBody);

    expect(res.statusCode).toBe(400);
    expect(res.text).toBe("Fixture already in database!");
  });

  test("PATCH /fixtures/update/:matchId Success: Fixture updated.🟢", async () => {
    reqBody.gameweekId = 18;

    const res = await req.patch(`/fixtures/update/${matchId}`).send(reqBody);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Match updated!");
  });

  test("PATCH /fixtures/update/:matchId Error: Fixture doesn't exist.🔴", async () => {
    const res = await req.patch(`/fixtures/update/<>`).send(reqBody);

    expect(res.statusCode).toBe(404);
    expect(res.text).toBe("Match doesn't exist!");
  });

  test("DELETE /fixtures/delete/:matchId Success: Fixture deleted.🟢", async () => {
    const res = await req.delete(`/fixtures/delete/${matchId}`);

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe("Match deleted!");
  });

  test("DELETE /fixtures/delete/:matchId Error: Fixture doesn't exist.🔴", async () => {
    const res = await req.delete(`/fixtures/delete/<>`);

    expect(res.statusCode).toBe(404);
    expect(res.text).toBe("Match doesn't exist!");
  });
});
