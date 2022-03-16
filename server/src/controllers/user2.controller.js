const asyncHandler = require("express-async-handler");
const User = require("../models/User");
const Gameweek = require("../models/Gameweek2");
const validateTeam = require("../utils/validators").validateTeam;
const pointDeductor = require("../utils/helpers").pointDeductor;

const transfer = asyncHandler(async (req, res) => {
  const { userId, incomingTeam } = req.body;

  // Fetch active gameweek
  let activeGameweek = await Gameweek.findOne({ status: "active" }).exec();
  activeGameweek = activeGameweek.number;

  // Validate team
  const [isTeamValid, errorType] = validateTeam(incomingTeam);

  // Save team || Send err
  if (isTeamValid === true) {
    // Fetch User Details
    const user = await User.findById(userId).exec();
    let activeTeam = user.team[activeGameweek - 1];

    // Calculate deduction
    const deduction = pointDeductor(activeTeam, incomingTeam);

    // Save deduction and incomingTeam to DB
    activeTeam = incomingTeam;
    activeTeam.deduction = deduction;

    // Update team with deduction for the current gameweek
    await User.findByIdAndUpdate(userId, { team: activeTeam });

    // !! SKIP if FH played
    if (incomingTeam.activeChip !== "FH") {
      // Update team with 0 deduction for the upcoming gameweeks
      activeTeam.deduction = 0;
      for (let gw = activeGameweek + 1; gw < 31; gw++) {
        activeTeam.gameweekId = gw;
        await User.findByIdAndUpdate(userId, { $push: { team: activeTeam } });
      }
    }

    res.status(200).json({ message: "Successfuly saved team" });
  } else {
    res.status(412).json(errorType);
  }
});

module.exports = { transfer };
