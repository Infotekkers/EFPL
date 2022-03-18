const mongoose = require("mongoose");
autoIncrement = require('mongoose-auto-increment');
var connection = mongoose.createConnection("mongodb://localhost:27017/FPLDB");
autoIncrement.initialize(connection);

const teamSchema = mongoose.Schema ({
    teamName: {type:String}
});

teamSchema.plugin(autoIncrement.plugin, { model: 'Team', field: 'teamId' });
var team = connection.model('Team', teamSchema); 

teamSchema.plugin(autoIncrement.plugin, {
    model: 'Team',
    field: 'teamId',
    startAt: 1,
    incrementBy: 1
    });

const Team = mongoose.model("team", teamSchema);

module.exports = Team;