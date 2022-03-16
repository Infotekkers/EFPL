// Import Libraries
const express = require("express");
require("dotenv").config();
const cors = require("cors");

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const fixtures = require("./src/routes/fixtures.routes");
const gameWeekRoutes = require("./src/routes/gameWeek.routes");

// Import Middleware
const errorMiddleware = require("./src/middleware/error.middleware");

// Add Node Features
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Rate Limit
const rateLimiter = require("./src/config/rate_config");
app.use(rateLimiter);

// Add Routes to app
app.use("/fixtures", fixtures);
app.use("/gameWeek", gameWeekRoutes);

// Add Middleware
app.use(errorMiddleware);

// Export app
module.exports = app;
