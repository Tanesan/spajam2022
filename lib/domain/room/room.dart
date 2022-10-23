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
    required this.score,
  });

  final List<User> users;
  final String problem;
  final String problemPrefix;
  final String problemSuffix;
  final String answer;
  final String aiPrediction;
  final String imageLink;
  final RoomStatus status;
  final Map<String, int> score;
}
