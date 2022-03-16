function processErrorMessage(errorObject) {
  /*
    ================================================================================================
   Generic Errors
    ================================================================================================
  */

  //   Min Length
  if (errorObject.message.includes("Custom Error - Minimum Length")) {
    errorObject.message = errorObject.message.split("*:")[1];
  }
  //   Max Length
  else if (errorObject.message.includes("Custom Error - Maximum Length ")) {
    errorObject.message = errorObject.message.split("*:")[1];
  }
  //   Required Value
  else if (errorObject.message.includes("Custom Error - Required Value")) {
    errorObject.message = errorObject.message.split("*:")[1];
  }
  // Invalid Value - Limited Values - ENUM
  else if (errorObject.message.includes("Custom Error - Invalid ENUM Value")) {
    errorObject.message = errorObject.message.split("*:")[1];
  }
  //   Min Value
  else if (errorObject.message.includes("Custom Error - Maximum Value")) {
    errorObject.message = errorObject.message.split("*:")[1];
  }
//  Unique Error
  else if (
    errorObject.message.includes("E11000 duplicate key error collection")
  ) {
    const errorValue = errorObject.message
      .split("{")[1]
      .replace("}", "")
      .replace(":", "");
    errorObject.message = `Value '${errorValue}' already exist.`;
  }

  //   Type Error -- VERY FRAGILE
  else if (
    errorObject.message.includes("Cast to") &&
    errorObject.message.includes("failed for value")
  ) {
    const errorValue = errorObject.message.split('"');

    errorObject.message = `Value '${errorValue[1]}' not allowed for ${errorValue[3]}`;
  }

  // Invalid Id sent

  return errorObject;
}

module.exports = { processErrorMessage };
