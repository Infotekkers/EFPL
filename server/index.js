// Import Libraries
const express = require("express");
require("dotenv").config();
const bodyParser = require("body-parser");
const cors = require("cors");

// Development Supports
const { printConsole } = require("./src/utils/development");

const PORT = process.env.PORT || 3000;
// Create express app
const app = express();

// Import DB Config
const connectToDB = require("./src/config/db_config");
connectToDB();

// Import Routes
const players = require("./src/routes/players.routes");

// Import Middleware

// Add Node Features
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(cors());

// Add Routes to app
app.use("/players", players);
// Export app
// Run Node app
app.listen(PORT, () =>
  printConsole(
    { data: `Server is live @${PORT}` },
    { printLocation: "index.js:28" },
    {
      bgColor: "bgGreen",
      textColor: "black",
      underline: true,
    }
  )
);
