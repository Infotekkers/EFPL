// const supertest = require("supertest");
// const app = require("../../index");
// const populate = require("../utils/populate");
// const Player = require("../models/Player");
// const mongoose = require("mongoose");
// const { bkConnection } = require("../models/Backup");

// const req = supertest(app);

// describe("Testing EPL stats ", () => {
//   afterAll(() => {
//     mongoose.connection.close();
//     bkConnection.close();
//   });

//   test("GET /eplStats/overview", async () => {
//     const expectedResult = {
//       mostGoals: {
//         name: "Kicker",
//         goals: 9,
//         assists: 0,
//         cleanSheets: 0,
//         reds: 1,
//         yellows: 0,
//         saves: 0,
//         minutesPlayed: 30,
//       },
//       mostAssists: {
//         name: "Not Kicker",
//         goals: 0,
//         assists: 9,
//         cleanSheets: 0,
//         reds: 0,
//         yellows: 6,
//         saves: 0,
//         minutesPlayed: 60,
//       },
//       mostCleanSheets: {
//         name: "Not Kicker",
//         goals: 0,
//         assists: 9,
//         cleanSheets: 0,
//         reds: 0,
//         yellows: 6,
//         saves: 0,
//         minutesPlayed: 60,
//       },
//       mostReds: {
//         name: "Kicker",
//         goals: 9,
//         assists: 0,
//         cleanSheets: 0,
//         reds: 1,
//         yellows: 0,
//         saves: 0,
//         minutesPlayed: 30,
//       },
//       mostYellows: {
//         name: "Not Kicker",
//         goals: 0,
//         assists: 9,
//         cleanSheets: 0,
//         reds: 0,
//         yellows: 6,
//         saves: 0,
//         minutesPlayed: 60,
//       },
//       mostSaves: {
//         name: "Keeper",
//         goals: 1,
//         assists: 0,
//         cleanSheets: 0,
//         reds: 1,
//         yellows: 3,
//         saves: 15,
//         minutesPlayed: 270,
//       },
//       mostMinutesPlayed: {
//         name: "Keeper",
//         goals: 1,
//         assists: 0,
//         cleanSheets: 0,
//         reds: 1,
//         yellows: 3,
//         saves: 15,
//         minutesPlayed: 270,
//       },
//     };

//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/overview");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/goals", async () => {
//     const expectedResult = [
//       { name: "Kicker", goals: 9 },
//       { name: "Keeper", goals: 1 },
//       { name: "Not Kicker", goals: 0 },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/goals");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/assists", async () => {
//     const expectedResult = [
//       { name: "Not Kicker", assists: 9 },
//       { name: "Keeper", assists: 0 },
//       { name: "Kicker", assists: 0 },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/assists");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/cleanSheets", async () => {
//     const expectedResult = [
//       { name: "Keeper", cleanSheets: 0 },
//       { name: "Kicker", cleanSheets: 0 },
//       {
//         name: "Not Kicker",
//         cleanSheets: 0,
//       },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/cleanSheets");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/reds", async () => {
//     const expectedResult = [
//       { name: "Keeper", reds: 1 },
//       { name: "Kicker", reds: 1 },
//       { name: "Not Kicker", reds: 0 },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/reds");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/yellows", async () => {
//     const expectedResult = [
//       { name: "Not Kicker", yellows: 6 },
//       { name: "Keeper", yellows: 3 },
//       { name: "Kicker", yellows: 0 },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/yellows");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/saves", async () => {
//     const expectedResult = [
//       { name: "Keeper", saves: 15 },
//       { name: "Kicker", saves: 0 },
//       { name: "Not Kicker", saves: 0 },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/saves");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });

//   test("GET /eplStats/minutesPlayed", async () => {
//     const expectedResult = [
//       {
//         name: "Keeper",
//         minutesPlayed: 270,
//       },
//       {
//         name: "Not Kicker",
//         minutesPlayed: 60,
//       },
//       {
//         name: "Kicker",
//         minutesPlayed: 30,
//       },
//     ];
//     // Clear DB
//     await Player.deleteMany();

//     // Populate DB
//     await populate.addTestPlayer();

//     // Send request
//     const res = await req.get("/eplStats/minutesPlayed");

//     // Expect response
//     expect(res.statusCode).toBe(200);
//     expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
//     expect(res.body).toMatchObject(expectedResult);
//   });
// });
