const mongoose = require("mongoose");

const teamSchema = mongoose.Schema ({
    id: {type: Number},
    teamName: {type:String}
});


const Team = mongoose.model("team", teamSchema);

module.exports = Team;