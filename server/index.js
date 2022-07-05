// import modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 5050;
var server = http.createServer(app);
const Room = require("./models/room");

var io = require("socket.io")(server);
// client -> middleware -> server
//  middle ware
app.use(express.json());

const DB =
  "mongodb+srv://jurody:1574906@cluster0.r3641.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
  console.log("conntected");
  socket.on("createRoom", async ({ nickname }) => {
    console.log(nickname);
    try {
      let room = new Room();

      let player = {
        socketID: socket.id,
        nickname,
        playerType: "X",
      };

      room.players.push(player);
      room.turn = player;
      room.currentRound = 1;
      room = await room.save();
      const roomID = room._id.toString();
      socket.join(roomID);

      io.to(roomID).emit("createRoomSuccess", room);
    } catch (error) {
      console.log(error);
    }
  });
  socket.on("joinRoom", async ({ nickname, roomID }) => {
    try {
      if (!roomID.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccured", "Invalid room ID");
        return;
      }
      let room = await Room.findById(roomID);
      if (room.isJoin) {
        let player = {
          nickname,
          socketID: socket.id,
          playerType: "O",
        };
        socket.join(roomID);
        room.players.push(player);
        room.isJoin = false;
        room = await room.save();
        io.to(roomID).emit("joinRoomSuccess", room);
        io.to(roomID).emit("updatePlayer", room.players);
        io.to(roomID).emit("updateRoom", room);
      } else {
        socket.emit("errorOccured", "Room is full");
      }
    } catch (e) {
      console.log(e);
    }
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
