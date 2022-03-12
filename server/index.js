// Import Libraries
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

// Development Supports

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const fantasyStatsRouter = require('./src/routes/fantasyStat.routes')
// Import Middleware

// Add Node Features
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app
app.use("/fantasyStats", fantasyStatsRouter);
// Export app
module.exports = app;
