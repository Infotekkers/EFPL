const asyncHandler = require("express-async-handler");
const User = require('../models/User');
const bcrypt = require('bcrypt');

// Registration
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

   // create user
   const user = new User({
       userName:req.body.userName,
       password:hashedPass,
       email:req.body.email,
       teamName:req.body.teamName,
       favoriteEplTeamId:req.body.favoriteEplTeamId

   })
   // save user to db
   const savedUser = await user.save();
   res.send(savedUser);


})

// Login
const login = asyncHandler(async(req,res)=>{
    
// check if email exists
  const user = await User.findOne({email:req.body.email});
  // check if password valid
  if(user){
      const passwordCheck = await bcrypt.compare(req.body.password,user.password);
      if(passwordCheck){
          res.send("logged in");
      }
      res.send("invalid email - password combination");
  } res.send("invalid email - password combination");

    
})

// fetch all users
const fetchUsers = asyncHandler(async(req,res)=>{
    const users = await User.find();
    res.json(users);
})

// fetch one user
const fetchOneUser = asyncHandler(async(req,res)=>{
    let user;
    user = await User.findById(req.params.id);
    if(user==null){
        return res.status(404).json({messaage:"No user found"})
    }
    res.user = user
    res.json(res.user);
})
// // change
// const changeUserName = asyncHandler(async(req,res)=>{

// }
module.exports={register,login, fetchUsers, fetchOneUser};