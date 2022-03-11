// Import Libraries
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

// Development Supports
const populate = require("./src/utils/populate"); // eslint-disable-line

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const eplStatsRouter = require("./src/routes/eplStats.routes");

// Import Middleware

// Add Node Features
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app
app.use("/eplStats", eplStatsRouter);

// Run populate scripts
// populate.addTestPlayer();

// Export app
module.exports = app;
