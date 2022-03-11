const express = require("express");
const user1controller = require('../controllers/user1.controller');
const router = express.Router();

router.post('/register',user1controller.register);
// router.post('/login', user1controller.login);

module.exports = router;