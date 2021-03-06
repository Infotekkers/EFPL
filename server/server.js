// Import libraries
require("dotenv").config();

const app = require(".");

// Development Supports
const { printConsole } = require("./src/utils/development");

// Import ENV Variables
const PORT = process.env.PORT || 3000;

// Import Pouplators
// const {
//   populateGameWeeks,
//   populateTeams,
//   // populateFixture,
// } = require("./src/utils/populate");
// const { populateGameWeeks,
// const {populateGameWeeks } = require("./src/utils/populate");

// Run Node app
app.listen(PORT, async () => {
  printConsole(
    { data: `Server is live @${PORT}` },
    { printLocation: "index.js:28" },
    {
      bgColor: "bgGreen",
      textColor: "black",
      underline: true,
    }
  );

  // await populateGameWeeks();
  // await populateTeams();
  // await populateFixture();
});
