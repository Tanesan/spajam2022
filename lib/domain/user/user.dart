class User {
  final String name;
  final UserType type;
  final String answer;
  final int score;

  User({
    required this.name,
    required this.type,
    required this.answer,
    required this.score,
  });
}

enum UserType {
  writer,
  reader,
}
