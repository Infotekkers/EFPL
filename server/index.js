// Import Libraries
const express = require("express");
require("dotenv").config();
const cors = require("cors");

// Development Supports

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const fixtures = require("./src/routes/fixtures.routes");

// Import Middleware

// Add Node Features
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app
app.use("/fixtures", fixtures);

// Export app
module.exports = app;
