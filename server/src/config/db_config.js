const { print_console } = require("../utils/development");

const mongoose = require("mongoose");
const MONGO_DB_URI =
  process.env.MONGO_REMOTE_URL || process.env.MONGO_LOCAL_URL;

const connectToDB = async () => {
  try {
    print_console(
      { data: "Connecting to MongoDB ......" },
      { printLocation: "db_config.js:12" },
      { textColor: "yellow" }
    );
    const DBConnection = await mongoose.connect(MONGO_DB_URI, {
      useNewUrlParser: true,
      // useCreateIndex: true,
      useUnifiedTopology: true,
      // useFindAndModify: false,
    });

    print_console(
      { data: `Database Connected : ${DBConnection.connection.host}` },
      { printLocation: "db_config.js:24" },
      {
        textColor: "green",
      }
    );
  } catch (error) {
    print_console(error);

    process.exit(1);
  }
};

module.exports = connectToDB;
