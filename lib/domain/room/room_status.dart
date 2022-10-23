enum RoomStatus { pending, playing, finished }

RoomStatus roomStatusFromString(String s) {
  switch (s) {
    case "pending":
      return RoomStatus.pending;
    case "playing":
      return RoomStatus.playing;
    case "finished":
      return RoomStatus.finished;
  }

  throw ArgumentError("Invalid string: $s");
}
