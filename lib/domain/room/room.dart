import 'package:spajam2022/domain/room/room_status.dart';
import 'package:spajam2022/domain/user/user.dart';

class Room {
  Room({
    required this.users,
    required this.problem,
    required this.problemPrefix,
    required this.problemSuffix,
    required this.iamgeLink,
    required this.status,
    required this.score,
  });

  final List<User> users;
  final String problem;
  final String problemPrefix;
  final String problemSuffix;
  final String iamgeLink;
  final RoomStatus status;
  final List<Map<String, int>> score;
}
