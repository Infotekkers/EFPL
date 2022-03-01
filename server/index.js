// Import Libraries
const express = require("express");
require("dotenv").config();
const bodyParser = require("body-parser");
const cors = require("cors");

// Development Supports
const { print_console } = require("./src/utils/development");

// Import ENV Variables
const PORT = process.env.PORT || 3000;

// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes

// Import Middleware

// Add Node Features
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app

// Run Node app
app.listen(PORT, () =>
  print_console(
    { data: `Server is live @${PORT}` },
    { printLocation: "index.js:28" },
    {
      bgColor: "bgGreen",
      textColor: "black",
      underline: true,
    }
  )
);
