const supertest = require('supertest');
const app = require('../../index');
const User = require('../models/User');
const mongoose = require('mongoose');

const req = supertest(app);



describe("Testing User ",()=>{
    test("POST /user1/register SUCCESS", async()=>{
        const reqBody = {
            userName:"Ghost Boy",
            password:"12345678@A1!",
            email:"great@gmail.com",
            teamName:"what",
            country:"Eth"
        };
        // clear db 
        await User.deleteMany();

        reqBody.userId = String((await User.findOne()._id));

        // send request
        const res = await req.post("/user1/register").send(reqBody);

        // expect response
        // expect(res.statusCode).toBe(201);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        // expect(res.reqBody).toMatchObject({message:"successfully registered"});

        test("Close DB", async()=>{
            mongoose.connection.close();
        })
    });
})