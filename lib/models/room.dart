import '../app_lib.dart';

class Room {
  String title;
  List<User> users;
  int? speakerCount;
  int? count;

  Room({
    required this.title,
    this.speakerCount,
    required this.users,
    this.count,
  });

  factory Room.fromJson(json) {
    return Room(
      title: json['title'],
      users: json['users'],
      speakerCount: json['speakerCount'],
      count: json['count'],
    );
  }
}
