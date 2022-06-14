const { printConsole } = require("../utils/development");

const mongoose = require("mongoose");
const MONGO_DB_URI =
  process.env.MONGO_REMOTE_URL || process.env.MONGO_LOCAL_URL;

const ENV = process.env.EXPRESS_ENV || "PRODUCTION";

const connectToDB = async () => {
  try {
    if (ENV === "development") {
      printConsole(
        { data: "Connecting to MongoDB ......" },
        { printLocation: "db_config.js:12" },
        { textColor: "yellow" }
      );
    }

    const DBConnection = await mongoose.connect(MONGO_DB_URI, {
      useNewUrlParser: true,
      // useCreateIndex: true,
      useUnifiedTopology: true,
      // useFindAndModify: false,
    });
    if (ENV === "development") {
      printConsole(
        { data: `Database Connected : ${DBConnection.connection.host}` },
        { printLocation: "db_config.js:24" },
        {
          textColor: "green",
        }
      );
    }
  } catch (error) {
    printConsole(error);

    process.exit(1);
  }
};

module.exports = connectToDB;
