import '../user/user.dart';
import 'room_status.dart';

class Room {
  Room({
    required this.users,
    required this.problem,
    required this.problemPrefix,
    required this.problemSuffix,
    required this.answer,
    required this.aiPrediction,
    required this.imageLink,
    required this.status,
  });

  final List<User> users;
  final String problem;
  final String problemPrefix;
  final String problemSuffix;
  final String answer;
  final String aiPrediction;
  final String imageLink;
  final RoomStatus status;

  static Room fromJson(Map<String, dynamic> json) {
    return Room(
      users: usersFromJson(json),
      problem: json['problem'],
      problemPrefix: json['problemPrefix'],
      problemSuffix: json['problemSuffix'],
      answer: json['answer'],
      aiPrediction: json['aiPrediction'],
      imageLink: json['imageLink'],
      status: roomStatusFromString(json['status']),
    );
  }

  static List<User> usersFromJson(Map<String, dynamic> json) {
    return json['users']
        .map<User>((dynamic data) => User(
              name: data['name'],
              type: data['type'] == UserType.writer.name
                  ? UserType.writer
                  : UserType.reader,
              answer: data['answer'],
              score: data['score'],
            ))
        .toList();
  }

  List<Map<String, dynamic>> usersToJson() {
    return users
        .map((u) => {
              'name': u.name,
              'type': u.type.name,
              'answer': u.answer,
              'score': u.score,
            })
        .toList();
  }
}
