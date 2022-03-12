const express = require('express');
const fantasyStatController = require('../controllers/fantasyStats.controller');
const router = express.Router();

router.get("/fetchFantasyStat", fantasyStatController.fetchFantasyStat);
router.get("/fetchAllFantasyStats", fantasyStatController.fetchAllFantasyStats);
// router.post("/addFantasyStats", fantasyStatController.addFantasyStats)
// router.patch("/updateFantasyStats", fantasyStatController.updateFantasyStats);
// router.patch("/deleteFantasyStats", fantasyStatController.deleteFantasyStats);


module.exports = router;
