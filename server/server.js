const app = require("./index");
const http = require("http");
const { Server } = require("socket.io");

// Development Supports
const { printConsole } = require("./src/utils/development");

// Import ENV Variables
const PORT = process.env.PORT || 3000;

const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: "http://localhost:3000",
    methods: ["GET", "POST"],
  },
});

io.on("connection", (socket) => {});

server.listen(PORT, () => {
  printConsole(
    { data: `Server+Socket is live @${PORT}` },
    { printLocation: "index.js:28" },
    {
      bgColor: "bgGreen",
      textColor: "black",
      underline: true,
    }
  );
});

module.exports = io;
