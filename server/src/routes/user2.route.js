const express = require("express");
const userController = require("../controllers/user2.controller");
const router = express.Router();

router.put("/transfer", userController.transfer);

module.exports = router;
