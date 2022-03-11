const express = require("express");
const user1controller = require('../controllers/user1.controller');
const router = express.Router();

router.post('/register',user1controller.register);
router.post('/login', user1controller.login);
router.get('/fetchAll', user1controller.fetchUsers);
router.get('/fetchOne/:id', user1controller.fetchOneUser);
router.patch('/updateUser/:id', user1controller.updateUser);
router.patch('/deleteUser/:id', user1controller.deleteUser);
module.exports = router;