const supertest = require('supertest');
const app = require('../../index');
const Player = require('../models/players');
const mongoose = require('mongoose');

const req = supertest(app);

afterAll(async () => {
    await Player.deleteMany();
    mongoose.connection.close();
});

let playerId;
describe("Testing Players",()=>{
// add players test success 
        test("POST /players/addplayer SUCCESS",async()=>{
            const reqBody = {
                "playerName": "barok",
                "position": "GK",
                "playerId": 1,
                "currentPrice":9.0,
                "score": {
                    "gameweekId": 1,
                    "price": 8.0,
                    "fantasyScore": 4,
                    "minutesPlayed":62,
                    "goal":0,
                    "assist":3, 
                    "cleanSheet":4,
                    "yellows":1,
                    "reds":1,
                    "penalitiesMissed":1,
                    "penalitiesSaved":5,
                    "saves":5,
                    "ownGoal":0,
                    "transfersIn":3,
                    "transfersOut":3,
                    "form":6
                    },
                    "availablity" : {
                        "injuryStatus": false,
                        "injuryMessage": "fit to play"
                },
                "history":{
                    "startingPrice":5.5,
                    "endingPrice":7.0,
                    "totalFantasyScore":34,
                    "totalMinutesPlayed":87,
                    "totalGoals":2,
                    "totalAssists":3,
                    "totalCleanSheets":1,
                    "totalYellows":1,
                    "totalReds":2,
                    "totalPenalitiesMissed":12,
                    "totalPenalitiesSaved":11,
                    "totalSaves":1,
                    "totalOwnGoal":2,
                    "totalTransfersIn":3,
                    "totalTransfersOut":4,
                    "totalform":7
                }

            };
            await Player.deleteMany();

            const res = await req.post("/players/addplayer").send(reqBody);

            // expect Response 
            expect(res.statusCode).tobe(200);
            expect(res.header["content-type"]).toBe("application/json; charset=utf-8");

        });

        test("PATCH /players/updateplayer/:playerId SUCCESS", async()=>{
            const reqBody = {
                "playerName": "barok",
                "position": "GK",
                "playerId": 1,
                "currentPrice":9.0,
                "availablity" : {
                    "injuryStatus": false,
                    "injuryMessage": "fit to play"
                },
                "history":{
                    "startingPrice":5.5,
                    "endingPrice":7.0,
                    "totalFantasyScore":34,
                    "totalMinutesPlayed":87,
                    "totalGoals":2,
                    "totalAssists":3,
                    "totalCleanSheets":1,
                    "totalYellows":1,
                    "totalReds":2,
                    "totalPenalitiesMissed":12,
                    "totalPenalitiesSaved":11,
                    "totalSaves":1,
                    "totalOwnGoal":2,
                    "totalTransfersIn":3,
                    "totalTransfersOut":4,
                    "totalform":7
                }    
            }; 
            await Player.deleteMany();

            // send request
            const res = await req.PATCH(`/players/updateplayer/${playerId}`).send(reqBody);
    
            // expect response
            expect(res.statusCode).toBe(201);
            expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
            

        });

        test("PATCH /players/updatescore/:playerId SUCCESS", async()=>{
            const reqBody = {
                "score": {
                    "gameweekId": 1,
                    "price": 8.0,
                    "fantasyScore": 4,
                    "minutesPlayed":62,
                    "goal":0,
                    "assist":3, 
                    "cleanSheet":4,
                    "yellows":1,
                    "reds":1,
                    "penalitiesMissed":1,
                    "penalitiesSaved":5,
                    "saves":5,
                    "ownGoal":0,
                    "transfersIn":3,
                    "transfersOut":3,
                    "form":6
                    },
               
            }; 
            await Player.deleteMany();

            // send request
            const res = await req.PATCH(`/players/updatescore/${playerId}`).send(reqBody);
    
            // expect response
            expect(res.statusCode).toBe(201);
            expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
            

        });

        test("PATCH /players/addscore/:playerId SUCCESS", async()=>{
            const reqBody = {
                "score": {
                    "gameweekId": 1,
                    "price": 8.0,
                    "fantasyScore": 4,
                    "minutesPlayed":62,
                    "goal":0,
                    "assist":3, 
                    "cleanSheet":4,
                    "yellows":1,
                    "reds":1,
                    "penalitiesMissed":1,
                    "penalitiesSaved":5,
                    "saves":5,
                    "ownGoal":0,
                    "transfersIn":3,
                    "transfersOut":3,
                    "form":6
                    },
               
            }; 
            

            // send request
            const res = await req.PATCH(`/players/updatescore/${playerId}`).send(reqBody);
    
            // expect response
            expect(res.statusCode).toBe(201);
            expect(res.header["content-type"]).toBe("application/json; charset=utf-8");
            

        });
});
