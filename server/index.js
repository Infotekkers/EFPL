// Import Libraries
const express = require("express");
require("dotenv").config();
const cors = require("cors");

// Development Supports
const populate = require("./src/utils/populate"); // eslint-disable-line

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const teams = require("./src/routes/team.routes");
const players = require("./src/routes/players.routes");
const eplStatsRouter = require("./src/routes/eplStats.routes");
const userRouter = require("./src/routes/user.routes");
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
app.use("/teams", teams);
app.use("/players", players);
app.use("/fixtures", fixtures);
app.use("/gameWeek", gameWeekRoutes);
app.use("/eplStats", eplStatsRouter);
app.use("/user", userRouter);

// Run populate scripts
// populate.addTestPlayer();
// populate.addTestUser();
// populate.addTestGameweek();
// populate.addTestFixture();

// Add Middleware
app.use(errorMiddleware);

// Run Node app
module.exports = app;
