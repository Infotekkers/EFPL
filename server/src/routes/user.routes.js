const express = require("express");
const userController = require("../controllers/user.controller");
const router = express.Router();

router.post("/register", userController.register);
router.post("/login", userController.login);
router.get("/fetchAll", userController.fetchUsers);
router.get("/fetchOne/:id", userController.fetchOneUser);
router.patch("/updateUser/:id", userController.updateUser);
router.patch("/deleteUser/:id", userController.deleteUser);
router.post("/requestReset", userController.requestReset);
router.post("/resetPass/:token", userController.resetPass);
router.put("/transfer", userController.transfer);

// new
router.get("/team", userController.getUserTeam);
router.patch("/team/:userId/:gameWeekId", userController.test);
router.patch("/test", userController.test);

module.exports = router;
