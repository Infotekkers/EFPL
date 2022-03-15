const supertest = require('supertest');
const app = require('../../index');
const User = require('../models/User');
const mongoose = require('mongoose');

const req = supertest(app);



describe("Testing User ",()=>{

    // Register Test Success
    test("POST /user1/register SUCCESS", async()=>{
        const reqBody = {
            
                "userName":"wechdad",
                "email":"chatadgaeonia@gmail.com",
                "password":"12345679@gAl",
                "teamName":"arrimish",
                "country":"bEthiopia"
            
            };
        // clear db 
        await User.deleteMany();

        // send request
        const res = await req.post("/user1/register").send(reqBody);

        // expect response
        expect(res.statusCode).toBe(201);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        
    
        
    });

    // Login Test Success
     test("POST /user1/login SUCCESS", async()=>{
        const reqBody = {
            "email":"chatadgaeonia@gmail.com",
            "password":"12345679@gAl",
        };

        // clear db 
        // await User.deleteMany();

         // send request
         const res = await req.post("/user1/login").send(reqBody);

           // expect response
        expect(res.statusCode).toBe(201);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");

     });
     // Login Test Failure
     test("POST /user1/login Failure", async()=>{
        const reqBody = {
            "email":"fhatadgaeonia@gmail.com",
            "password":"12345679@gAl",
        };

        // clear db 
        // await User.deleteMany();

         // send request
         const res = await req.post("/user1/login").send(reqBody);

           // expect response
        expect(res.statusCode).toBe(400);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        expect(res.body).toMatchObject({message:"invalid email - password combination"});

     })
    test("Close DB", async()=>{
        mongoose.connection.close();
    })
})