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
    

    // change item success
    test("PATCH /user1/updateUser/:id SUCCESS", async()=>{
        const reqBody = {
            "userName":"Megalodons"
        };

        // clear db 
        // await User.deleteMany();

        const userId = String((await User.findOne())._id);
        
         // send request
         const res = await req.patch(`/user1/updateUser/${userId}`).send(reqBody);

        //    expect response
        expect(res.statusCode).toBe(201);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");

     });
     // change item failure
    test("PATCH /user1/updateUser/:id FAILURE", async()=>{
        const reqBody = {
            "userName":"Megalodons"
        };
        const userId = "623592e7efb835b140828098"
         // send request
         const res = await req.patch(`/user1/updateUser/${userId}`).send(reqBody);
        //    expect response
        expect(res.statusCode).toBe(404);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
     });
     
     // request reset test
     test("POST /user1/requestReset SUCCESS", async()=>{
        const reqBody = {
            "email":"chatadgaeonia@gmail.com"
        };      

         // send request
         const res = await req.post(`/user1/requestReset`).send(reqBody);
         
        //    expect response
        expect(res.statusCode).toBe(200);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        expect(res.body).toMatchObject({messaage:"Email Sent Successfully"});
     });
     
     // reset password test
     test("POST /user1/resetPass/:token SUCCESS", async()=>{
        const reqBody = {
            "password":"Bingus@12345678!"
        };        

        const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiY2hhdGFkZ2Flb25pYUBnbWFpbC5jb20iLCJpYXQiOjE2NDc2Nzk1NzgsImV4cCI6MTY0NzY4MzE3OH0.kjyfS2EfphjGETuQCOG4c_jkq4KcSytCQJwrb0cbAVM";
         // send request
         const res = await req.post(`/user1/resetPass/${token}`).send(reqBody);
        //    expect response
        expect(res.statusCode).toBe(200);
        expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
        expect(res.body).toMatchObject({message:"password reset successfully"});
     });
     test("Close DB", async()=>{
        mongoose.connection.close();
    })
})