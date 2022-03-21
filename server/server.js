// Import libraries
require("dotenv").config();

const app = require(".");

// Development Supports
const { printConsole } = require("./src/utils/development");

// Import ENV Variables
const PORT = process.env.PORT || 3000;

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
