import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:spajam2022/domain/room/room_status.dart';

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

    final room = Room(
      users: jsonObj['users']
          .map<User>((dynamic data) => User(
                name: data['name'],
                type: data['type'] == UserType.writer.name
                    ? UserType.writer
                    : UserType.reader,
                answer: data['answer'],
                score: data['score'],
              ))
          .toList(),
      problem: jsonObj['problem'],
      problemPrefix: jsonObj['problemPrefix'],
      problemSuffix: jsonObj['problemSuffix'],
      answer: jsonObj['answer'],
      aiPrediction: jsonObj['aiPrediction'],
      imageLink: jsonObj['imageLink'],
      status: roomStatusFromString(jsonObj['status']),
      score: jsonObj['score'],
    );
    print(room);

    controller.sink.add(room);
  });

  return controller.stream;
}

/// ルーム情報を取得する
Future<Room> fetchRoomData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final snapshot = await ref.get();

  if (snapshot.exists) {
    final json = snapshot.value as Map<String, dynamic>;
    return Room(
      users: json['users'],
      problem: json['problem'],
      problemPrefix: json['problemPrefix'],
      problemSuffix: json['problemSuffix'],
      answer: json['answer'],
      aiPrediction: json['aiPrediction'],
      imageLink: json['imageLink'],
      status: json['status'],
      score: json['score'],
    );
  } else {
    throw Exception();
  }
}

/// ルームに参加する
void enterRoom({required String name}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('rooms/$roomId');

  final room = await fetchRoomData();

  await ref.set({
    "users": [
      ...room.users,
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
