const express = require("express");
const userController = require("../controllers/user.controller");
const router = express.Router();

router.post("/register", userController.register);
router.post("/login", userController.login);
router.get("/fetchAll", userController.fetchUsers);
router.get("/fetchOne/:id", userController.fetchOneUser);
router.get("/fetchUserTeam/:gw", userController.fetchUserTeam);
router.patch("/updateUser/:id", userController.updateUser);
router.patch("/deleteUser/:id", userController.deleteUser);
router.post("/requestReset", userController.requestReset);
router.post("/resetPass/:token", userController.resetPass);
router.put("/transfer", userController.transfer);
router.post("/validateUser", userController.validateUser);

// new
router.get("/team", userController.getUserTeam);
router.patch("/team/", userController.transfer);
router.get("/point/:gameWeekId", userController.getUserPoints);
router.get("/watchList", userController.getUserWatchList);
router.patch("/watchList", userController.addUserWatchList);
router.delete("/watchList", userController.removeUserWatchList);
router.delete("/watchList/all", userController.removeAllUserWatchList);

module.exports = router;
