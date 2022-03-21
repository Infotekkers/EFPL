// Import Libraries
const express = require("express");
require("dotenv").config();
const cors = require("cors");

// Development Supports
const { printConsole } = require("./src/utils/development");

// Import ENV Variables
const PORT = process.env.PORT || 3000;

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const teams = require("./src/routes/team.routes");

// Import Middleware

// Add Node Features
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app
app.use("/teams", teams);

// Run Node app
module.exports = app;
