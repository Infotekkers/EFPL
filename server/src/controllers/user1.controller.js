const asyncHandler = require("express-async-handler");
const User = require('../models/User');
const bcrypt = require('bcrypt');


const register = asyncHandler(async(req, res)=>{
    // check for prexisting email
    const emailExists = await User.findOne({email:req.body.email});
    // check for used team name
    const teamNameExists = await User.findOne({teamName:req.body.teamName});

    if(emailExists) return res.status(400).send('Email in Use');
    if(teamNameExists) return res.status(400).send('Team Name in Use');

    // hash password
   const salt = await bcrypt.genSalt(10);
   const hashedPass = await bcrypt.hash(req.body.password, salt);

   const user = new User({
       userName:req.body.userName,
       password:hashedPass,
       email:req.body.email,
       teamName:req.body.teamName,
       favoriteEplTeamId:req.body.favoriteEplTeamId

   })
   const savedUser = await user.save();
   res.send(savedUser);


})
module.exports={register};