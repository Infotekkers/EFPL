const { printConsole } = require("../utils/development");

// Import Error Message Processor
const { processErrorMessage } = require("../error/errorProcessor");

const errorHandler = (err, req, res, next) => {
  // get error json
  const errorObject = {
    message: err.message,
    status: err.status ? err.status : 422,
    stack: process.env.EXPRESS_ENV === "development" ? err.stack : null,
  };

  res.status(errorObject.status).json(processErrorMessage(errorObject));
  console.log(err);
  printConsole(
    {
      data: errorObject.message,
    },
    { printLocation: "error.middleware.js:20" },
    { bgColor: "bgRed" },
    { textColor: "black" }
  );
};

module.exports = errorHandler;
