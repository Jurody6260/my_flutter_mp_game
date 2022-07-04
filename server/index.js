// import modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 5050;
var server = http.createServer(app);

var io = require("socket.io")(server);

// client -> middleware -> server
//  middle ware
app.use(express.json());

const DB =
  "mongodb+srv://jurody:1574906@cluster0.r3641.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
  console.log("conntected");
  socket.on("createRoom", ({ nickname }) => {
    console.log(nickname);
  });
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("DB connected");
  })
  .catch((e) => {
    console.log(e);
  });

server.listen(port, "0.0.0.0", () => {
  console.log(`Server listening on port ${port}`);
});
