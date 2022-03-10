// Import Libraries
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const gameWeekRoutes = require("./src/routes/gameWeek.routes");

// Import Middleware
const errorMiddleware = require("./src/middleware/error.middleware");

// Add Node Features
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Rate Limit
const rateLimiter = require("./src/config/rate_config");
app.use(rateLimiter);

// Add Routes to app
app.use("/gameWeek", gameWeekRoutes);
app.get("/rate", (req, res) => {
  res.send("Done");
});

// Add Middleware
app.use(errorMiddleware);

// Export app
module.exports = app;
