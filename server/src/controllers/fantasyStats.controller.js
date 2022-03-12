const asyncHandler = require('express-async-handler');
const Stats2 = require('../models/Stats2');


// get one stat
const fetchFantasyStat = asyncHandler(async(req,res)=>{
    let stat;
    stat = await Stats2.findById(req.params.id);
    if(user==null){
        return res.status(404).json({message:"no stat found"})
    }
    res.stat = stat;
    res.json(res.stat);
})

// get all stats
const fetchAllFantasyStats = asyncHandler(async(req,res)=>{
    const stats = await Stats2.find();
    resizeBy.json(stats)
})

// add stats
// const addFantasyStats = asyncHandler(async(req,res)=>{
    
// })

// update stats
// const updateFantasyStats = asyncHandler(async(req,res)=>{
    
// })

// delete stats
// const deleteFantasyStats = asyncHandler(async(req,res)=>{
    
// })

module.exports={fetchFantasyStat, fetchAllFantasyStats};
