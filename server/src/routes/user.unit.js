const supertest = require("supertest");
const mongoose = require("mongoose");
const app = require("../../index");
const User = require("../models/User");
// const Gameweek = require("../models/GameWeek");
// const populate = require("../utils/populate");
const { bkConnection } = require("../models/Backup");
const req = supertest(app);

describe("Testing User Routes", () => {
  afterAll(() => {
    mongoose.connection.close();
    bkConnection.close();
  });

  /*
    =================================================
    Invalid UserName
    =================================================
  */
  // Symbol in username
  test("POST /user/register FAIL - Username with Symbol-@", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "@EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Username with Symbol-$", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "$EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Username with Symbol- >", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: ">EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Username with Symbol- <", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: ">EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  // Empty Username
  test("POST /user/register FAIL - Empty Username", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  // Short Username
  test("POST /user/register FAIL - Short Username < 3", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EF",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  // Long Username
  test("POST /user/register FAIL - Long Username > 32", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "Ethiopian Fantasy Premier League User Account For Testing",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Email
    =================================================
  */
  // No @ in email
  test("POST /user/register FAIL - Invalid Email-Text Only", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUsergmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  // Invalid Symbol
  test("POST /user/register FAIL - Invalid Email- Added Symbol", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@$gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  // Empty Email
  test("POST /user/register FAIL - Invalid Email- Added Symbol", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Password
    =================================================
  */
  test("POST /user/register FAIL - Short Password < 8", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUsergmail.com",
      password: "StrongP",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Weak Password - Text Only", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@$gmail.com",
      password: "StrongPassword",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Weak Password - Number Only", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efpluser@gmail.com",
      password: "123456789",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Symbols Only - Number Only", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efpluser@gmail.com",
      password: "@!@@!!@@#@@#@#",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Long Password > 64", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efpluser@gmail.com",
      password:
        "StrongPasswordForEFPLUser@1234567890!ThisPasswordIsTooLongToStoreOnDBBecauseItWillBeHashedAsWell",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Empty Password", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efpluser@gmail.com",
      password: "",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid TeamName
    =================================================
  */
  test("POST /user/register FAIL - Long Team Name > 32", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "TeamNameFor Ethiopian Fantasy Premiere League User Team",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Empty Team Name", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });
  test("POST /user/register FAIL - Short Team Name < 3", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EF",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Invalid Country
    =================================================
  */
  test("POST /user/register FAIL - Long Country Name > 56", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country:
        "Country Name For Ethiopian Fantasy Premiere League User Location of Origin",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /user/register FAIL - Short Country Name < 4", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country: "Cha",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /user/register FAIL - Invalid Country Name - Number", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country: "Chad2",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /user/register FAIL - Invalid Country Name - Symbol - @", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country: "Chad@",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /user/register FAIL - Invalid Country Name - Symbol - <", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country: "Chad<",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  test("POST /user/register FAIL - Invalid Country Name - Symbol - >", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPLUser",
      email: "efplTestUser@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPLTeam",
      country: "Chad>",
    });

    // expect response
    expect(res.statusCode).toBe(422);
  });

  /*
    =================================================
    Success Register
    =================================================
  */
  test("POST /user/register SUCCESS", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPL User",
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  /*
    =================================================
    Duplicate Email
    =================================================
  */
  test("POST /user/register FAIL - Duplicate Email", async () => {
    // clear db
    await User.deleteMany();

    // send request
    const res = await req.post("/user/register").send({
      userName: "EFPL User",
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    const responseTwo = await req.post("/user/register").send({
      userName: "EFPL User",
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");

    expect(responseTwo.statusCode).toBe(400);
  });

  /*
    =================================================
    Login
    =================================================
  */
  test("POST /user/login FAIL - Login Invalid Email & No Token", async () => {
    // send request
    const res = await req.post("/user/login").send({
      email: "efplTestUsesrr@gmail.com",
      password: "StrongPass@123456",
    });

    // expect response
    expect(res.statusCode).toBe(400);
    expect(res.body.token === "");
  });

  test("POST /user/login SUCCESS - Login Invalid Password & No Token", async () => {
    // send request
    const res = await req.post("/user/login").send({
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@1234567",
    });

    // expect response
    expect(res.statusCode).toBe(400);
    expect(res.body.token === "");
  });

  test("POST /user/login SUCCESS - Login & Expect Token", async () => {
    // send request
    const res = await req.post("/user/login").send({
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@123456",
    });

    // expect response
    expect(res.statusCode).toBe(201);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
    expect(res.body.token !== "");
  });

  /*
    =================================================
    Update User Info
    =================================================
  */
  // change item success
  test("PATCH /user/updateUser/:id SUCCESS - Update User Information", async () => {
    // Register user
    await User.deleteMany();

    // send request
    const resReg = await req.post("/user/register").send({
      userName: "EFPL User",
      email: "efplTestUsesr@gmail.com",
      password: "StrongPass@123456",
      teamName: "EFPL TEAM",
      country: "Ethiopia",
    });

    // get user id
    const uid = await User.findOne({ email: "efplTestUsesr@gmail.com" });

    // // send request
    const res = await req.patch(`/user/updateUser/${uid.id}`).send({
      userName: "EFPL Team",
    });

    //    expect response
    expect(resReg.statusCode).toBe(201);
    expect(resReg.header["content-type"]).toBe(
      "application/json; charset=utf-8"
    );

    expect(res.statusCode).toBe(200);
    expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
  });

  test("PATCH /user/updateUser/:id FAIL - Non existing ID", async () => {
    // Register user
    await User.deleteMany();

    // // send request
    const res = await req.patch(`/user/updateUser/123456`).send({
      userName: "EFPL Team",
    });

    //    expect response
    expect(res.statusCode).toBe(422);
  });

  // test("POST /user1/requestReset SUCCESS", async () => {
  //   // Register user
  //   await User.deleteMany();

  //   // send request
  //   await req.post("/user/register").send({
  //     userName: "EFPL User",
  //     email: "efplTestUsesr@gmail.com",
  //     password: "StrongPass@123456",
  //     teamName: "EFPL TEAM",
  //     country: "Ethiopia",
  //   });

  //   // send request
  //   const res = await req.post(`/user/requestReset`).send({
  //     email: "efplTestUsesr@gmail.com",
  //   });

  //   //    expect response
  //   expect(res.statusCode).toBe(400);
  // });

  /*
    =================================================
    Transfer Tests
    =================================================
  */

  /*
    =================================================
    Points Tests
    =================================================
  */

  /*
    =================================================
    Watchlist Tests
    =================================================
  */
});
