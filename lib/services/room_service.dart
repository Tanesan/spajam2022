import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../domain/room/room.dart';
import '../domain/user/user.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

// FIXME
const roomId = 'a43y89';

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
    'status': 'pending',
    'score': [
      {"user": name, "value": 0}
    ]
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
    "score": [
      ...room.score,
      {"user": name, "value": 0}
    ]
  });
}

/// ゲームを開始する（開始を他のユーザーに通知する）
Future<void> startGame() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({
    'status': 'playing',
  });
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
    'answer': answer
  });
}

/// 書いたものを送信する（他のユーザーに通知する）
Future<void> postWriting(String imageLink) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({
    'imageLink': imageLink,
  });
}

/// AIの推測をを送信する（他のユーザーに通知する）
Future<void> postAiPrediction(String aiPrediction) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({
    'aiPrediction': aiPrediction,
  });
}

/// ユーザーの得点を送信
Future<void> postUsersScores(Map<String, int> score) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final room = await fetchRoomData();

  await ref.update({
    'score': [...room.score, score],
  });
}

/// ゲームを終了する（終了を他のユーザーに通知する）
Future<void> finishGame() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');
  await ref.update({
    'status': 'finished',
  });
}
