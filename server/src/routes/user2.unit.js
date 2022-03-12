// const supertest = require("supertest");
// const app = require("../../index");
// const populate = require("../utils/populate");
// const User = require("../models/User");
const mongoose = require("mongoose");

// const req = supertest(app);

describe("Testing user ", () => {
  test("GET /user/transfer SUCCESS", async () => {});
  test("GET /user/transfer ERROR", async () => {});
  test("GET /user/transfer ERROR", async () => {});

  test("Close DB", async () => {
    mongoose.connection.close();
  });
});
