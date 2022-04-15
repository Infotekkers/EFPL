const asyncHandler = require("express-async-handler");
const fs = require("fs");

// const mongoose = require("mongoose");
const Teams = require("../models/Teams");
const Players = require("../models/Player");
const Fixture = require("../models/Fixtures");
//   );
const backup = asyncHandler(async (req, res) => {
  // mongoose.connection.close();

  const team = await Teams.find();
  const player = await Players.find();
  const fixture = await Fixture.find();
  const season = req.params.id;

  try {
    fs.writeFileSync(
      `src/controllers/f/${season}-player.json`,
      JSON.stringify(player)
    );
    fs.writeFileSync(
      `src/controllers/f/${season}-team.json`,
      JSON.stringify(team)
    );
    fs.writeFileSync(
      `src/controllers/f/${season}-fixture.json`,
      JSON.stringify(fixture)
    );

    res.json("success");
  } catch (err) {
    res.send(err);
    console.log(err);
  }
});
const restore = asyncHandler(async (req, res) => {
  const season = req.params.id;
 try{
    const data = fs.readFileSync(`src/controllers/f/${season}-team.json`);
    const docs = JSON.parse(data.toString());
    res.send(docs);
 }catch(err){
    
     if(err.errno===-4058){
         
         res.status(422).json({message:`No data for season ${season}`})
     }
    else{
        res.send(err)
    }
 }
});

module.exports = { backup, restore };
