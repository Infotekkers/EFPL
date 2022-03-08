const express = require("express");
const router = express.Router();

const testController = require("../controllers/test.controllers");

router.get("/test", testController.getTest);
module.exports = router;
