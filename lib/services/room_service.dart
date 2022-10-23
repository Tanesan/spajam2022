import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:spajam2022/domain/room/room_status.dart';

import '../domain/room/room.dart';
import '../domain/user/user.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

// FIXME
const roomId = '1';

/// ルームを作成する
Future<String> createRoom({required String name}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.set({
    "users": [
      {'name': name, 'type': UserType.writer.name, 'answer': '', 'score': 0}
    ],
    'problem': '',
    'problemPrefix': '',
    'problemSuffix': '',
    'imageLink': '',
    'answer': '',
    'aiPrediction': '',
    'status': RoomStatus.pending.name,
  });

  return roomId;
}

/// ルーム情報を購読するStreamを返す
Stream<Room> listenRoomData() {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final controller = StreamController<Room>();

  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    if (data == null) {
      return;
    }

    final Map<String, dynamic> jsonObj = json.decode(json.encode(data));
    final room = Room.fromJson(jsonObj);

    controller.sink.add(room);
  });

  return controller.stream;
}

/// ルーム情報を取得する
Future<Room> fetchRoomData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final snapshot = await ref.get();
  if (!snapshot.exists) throw Exception();

  final Map<String, dynamic> jsonObj = json.decode(json.encode(snapshot.value));
  return Room.fromJson(jsonObj);
}

/// ルームに参加する
Future<void> enterRoom({required String name}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final room = await fetchRoomData();

  await ref.update({
    "users": [
      ...room.usersToJson(),
      {'name': name, 'type': UserType.reader.name, 'answer': '', 'score': 0},
    ],
  });
}

/// ゲームを開始する（開始を他のユーザーに通知する）
Future<void> startGame() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({'status': RoomStatus.playing.name});
}

/// 問題を追加する
Future<void> postProblem({
  required String problem,
  required String problemPrefix,
  required String problemSuffix,
  required String answer,
}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({
    'problem': problem,
    'problemPrefix': problemPrefix,
    'problemSuffix': problemSuffix,
    'answer': answer,
  });
}

/// 書いたものを送信する（他のユーザーに通知する）
Future<void> postWriting(String imageLink) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({'imageLink': imageLink});
}

/// AIの推測をを送信する（他のユーザーに通知する）
Future<void> postAiPrediction(String aiPrediction) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({'aiPrediction': aiPrediction});
}

/// ユーザーの得点を送信
Future<void> postUsersScores() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final room = await fetchRoomData();

  for (var i = 0; i < room.users.length; i++) {
    final userType = room.users[i].type;

    switch (userType) {
      case UserType.writer:
        room.users[i].score += calcWriterScore(room);
        break;
      case UserType.reader:
        room.users[i].score += calcReaderScore(room, i);
        break;
      default:
        throw StateError("Invalid userType: $userType");
    }
  }

  await ref.update({'users': room.usersToJson()});
}

int calcWriterScore(Room room) {
  var score = 0;

  // 10 points per correctly guessed others.
  var readers = room.users.where((e) => e.type != UserType.writer);
  score += readers.where((e) => e.answer == room.answer).length * 10;

  // 30 points if AI prediction is correct.
  if (room.aiPrediction == room.answer) score += 30;

  return score;
}

int calcReaderScore(Room room, int index) {
  var score = 0;
  var userAnswer = room.users[index].answer;

  // 10 points if correctly guessed.
  if (userAnswer == room.answer) {
    score += 10;
  }
  // 30 points if incorrectly guessed but matched to AI prediction.
  else if (userAnswer == room.aiPrediction) {
    score += 30;
  }

  return score;
}

/// ゲームを終了する（終了を他のユーザーに通知する）
Future<void> finishGame() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({'status': RoomStatus.finished.name});
}
