const supertest = require('supertest');
const app = require('../../index');
const User = require('../models/User');
const mongoose = require('mongoose');

const req = supertest(app);



describe("Testing User ",()=>{
    test("POST /user1/register SUCCESS", async()=>{
        const reqBody = {
            
                "userName":"wechdad",
                "email":"fatadgaeonia@gmail.com",
                "password":"12345679@gAl",
                "teamName":"arrimish",
                "country":"Ethiopia"
            
            };
        // clear db 
        await User.deleteMany();

        // reqBody.userId = String((await User.findOne()._id));

        // send request
        const res = await req.post("/user1/register").send(reqBody);

        // expect response
        expect(res.statusCode).toBe(201);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        
    
        
    });
    // test("POST")
    test("Close DB", async()=>{
        mongoose.connection.close();
    })
})