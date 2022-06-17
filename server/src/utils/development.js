require("colors");
require("dotenv");
const asyncHandler = require("express-async-handler");
const GameWeek = require("../models/GameWeek");
require("dotenv").config({ path: "../../.env" });
const ENV = process.env.EXPRESS_ENV || "PRODUCTION";
// const ENV = "PRODUCTION";
/*
  ===============================================================
  DEBUG PRINT WITH COLORS SUPPORT
  ===============================================================
*/
function printConsole(
  { data = "No data" } = {},
  { printLocation = "Print Location not Added" } = {},
  { bgColor = "", textColor = "", underline = false } = {}
) {
  if (ENV === "development") {
    const finalPrint = getUnderline(
      getTextColor(getBgColor(data, bgColor), textColor),
      underline
    );
    console.log(
      finalPrint,
      "Debugging ON. Please Review".toLocaleUpperCase().red.underline,
      printLocation.gray
    );
  }
}

function getBgColor(data, bgColor) {
  switch (bgColor) {
    case "":
      return data;
    case "bgYellow":
      return data.bgYellow;
    case "bgBlue":
      return data.bgBlue;
    case "bgCyan":
      return data.bgCyan;
    case "bgGreen":
      return data.bgGreen;
    case "bgRed":
      return data.bgRed;
    case "bgGrey":
      return data.bgGrey;
  }
}

function getTextColor(data, textColor) {
  switch (textColor) {
    case "":
      return data;

    case "black":
      return data.black;
    case "blue":
      return data.blue;
    case "cyan":
      return data.cyan;
    case "green":
      return data.green;
    case "red":
      return data.red;
    case "grey":
      return data.grey;
    case "yellow":
      return data.yellow;
    case "magenta":
      return data.cyan;
    default:
      return data.white;
  }
}

function getUnderline(data, underline) {
  switch (underline) {
    case false:
      return data;

    case true:
      return data.underline;
  }
}

/*
  ===============================================================
  Development Routes
  ===============================================================
*/
const devAddGameWeekRoute = asyncHandler(async (req, res) => {
  // if (ENV === "development") {
  // get data from body
  const { newGameWeekData } = req.body;

  // create data from model
  const newGameWeek = await GameWeek.create(newGameWeekData);

  // send response
  res.status(201).json(newGameWeek);

  // print dev warning
  printConsole(
    { data: "Request for Adding New Game Week" },
    { printLocation: "development.js:101 - Development Feature" },
    {
      bgColor: "bgRed",
      textColor: "black",
    }
  );
  // }
});

const devClearGameWeekRoute = asyncHandler(async (req, res) => {
  if (ENV === "development") {
    const deletedGameWeek = await GameWeek.deleteMany();

    res.status(200).json(deletedGameWeek);
  }
});

module.exports = {
  printConsole,
  devAddGameWeekRoute,
  devClearGameWeekRoute,
};
