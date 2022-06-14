// const supertest = require("supertest");
// const app = require("../../index");

// const Fixture = require("../models/Fixtures");
// const mongoose = require("mongoose");
// const { bkConnection } = require("../models/Backup");

// // Test data import
// const { reqBody, matchId } = require("../utils/data/fixture.test.data");

// const req = supertest(app);

// describe("Fixture status updates", () => {
//   beforeEach(async () => {
//     await new Fixture(reqBody).save();
//   });

//   afterEach(async () => {
//     await Fixture.findOne({ matchId }).deleteOne();
//   });

//   afterAll(() => {
//     mongoose.connection.close();
//     bkConnection.close();
//   });

//   /***********************************************************/
//   //   Start route
//   test("PATCH /fixtures/start/:matchId Success: Fixture started.🟢", async () => {
//     const res = await req.patch(`/fixtures/start/${matchId}`);

//     expect(res.statusCode).toBe(200);
//     expect(res.text).toBe("Match is live!");
//   });

//   test("PATCH /fixtures/start/:matchId Error: Fixture doesn't exist.🔴", async () => {
//     const res = await req.patch("/fixtures/start/<>");

//     expect(res.statusCode).toBe(404);
//     expect(res.text).toBe("Match doesn't exist!");
//   });

//   test("Patch /fixtures/start/:matchId Error: Fixture status not 'scheduled'.🔴", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "liveFH";
//     match.save();

//     const res = await req.patch(`/fixtures/start/${matchId}`);

//     expect(res.statusCode).toBe(400);
//     expect(res.text).toBe("Match can't be started!");
//   });

//   // /***********************************************************/
//   // Pause route
//   test("PATCH /fixtures/pause/:matchId Success: Fixture paused.🟢", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "liveFH";
//     match.save();

//     const res = await req.patch(`/fixtures/pause/${matchId}`);

//     expect(res.statusCode).toBe(200);
//     expect(res.text).toBe("Half Time!");
//   });

//   test("PATCH /fixtures/pause/:matchId Error: Fixture doesn't exist.🔴", async () => {
//     const res = await req.patch("/fixtures/pause/<>");

//     expect(res.statusCode).toBe(404);
//     expect(res.text).toBe("Match doesn't exist!");
//   });

//   test("Patch /fixtures/pause/:matchId Error: Fixture status not 'scheduled'.🔴", async () => {
//     const res = await req.patch(`/fixtures/pause/${matchId}`);

//     expect(res.statusCode).toBe(400);
//     expect(res.text).toBe("Match hasn't started!");
//   });

//   // /***********************************************************/
//   // // Resume route
//   test("PATCH /fixtures/resume/:matchId Success: Fixture resumed.🟢", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "HT";
//     match.save();

//     const res = await req.patch(`/fixtures/resume/${matchId}`);

//     expect(res.statusCode).toBe(200);
//     expect(res.text).toBe("Match resumed!");
//   });

//   test("PATCH /fixtures/resume/:matchId Error: Fixture doesn't exist.🔴", async () => {
//     const res = await req.patch("/fixtures/resume/<>");

//     expect(res.statusCode).toBe(404);
//     expect(res.text).toBe("Match doesn't exist!");
//   });

//   test("PATCH /fixtures/resume/:matchId Error: Fixture status not 'HT'.🔴", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "scheduled";
//     match.save();

//     const res = await req.patch(`/fixtures/resume/${matchId}`);

//     expect(res.statusCode).toBe(400);
//     expect(res.text).toBe("Match can't be resumed!");
//   });

//   // /***********************************************************/
//   // End route
//   test("PATCH /fixtures/end/:matchId Success: Fixture ended.🟢", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "liveSH";
//     match.save();

//     const res = await req.patch(`/fixtures/end/${matchId}`);

//     expect(res.statusCode).toBe(200);
//     expect(res.text).toBe("Full time!");
//   });

//   test("PATCH /fixtures/end/:matchId Error: Fixture doesn't exist.🔴", async () => {
//     const res = await req.patch("/fixtures/end/<>");

//     expect(res.statusCode).toBe(404);
//     expect(res.text).toBe("Match doesn't exist!");
//   });

//   test("PATCH /fixtures/end/:matchId Error: Fixture status not 'LiveSH'.🔴", async () => {
//     const res = await req.patch(`/fixtures/end/${matchId}`);

//     expect(res.statusCode).toBe(400);
//     expect(res.text).toBe("Match can't be ended!");
//   });

//   // /***********************************************************/
//   // Postpone route
//   test("PATCH /fixtures/postpone/:matchId Success: Fixture postponed.🟢", async () => {
//     const res = await req.patch(`/fixtures/postpone/${matchId}`);

//     expect(res.statusCode).toBe(200);
//     expect(res.text).toBe("Match postponed!");
//   });

//   test("PATCH /fixtures/postpone/:matchId Error: Fixture doesn't exist.🔴", async () => {
//     const res = await req.patch("/fixtures/postpone/<>");

//     expect(res.statusCode).toBe(404);
//     expect(res.text).toBe("Match doesn't exist!");
//   });

//   test("PATCH /fixtures/end/:matchId Success: Fixture has been started.🔴", async () => {
//     const match = await Fixture.findOne({ matchId });
//     match.status = "liveFH";
//     match.save();

//     const res = await req.patch(`/fixtures/postpone/${matchId}`);

//     expect(res.statusCode).toBe(400);
//     expect(res.text).toBe("Match is ongoing!");
//   });
// });
