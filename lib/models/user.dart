class User {
  String name;
  String? username;
  String profileImage;
  String? lastAccessTime;
  String? followers;
  String? following;
  bool? isNewUser;

  User({
    required this.name,
    this.username,
    required this.profileImage,
    this.followers,
    this.following,
    this.lastAccessTime,
    this.isNewUser,
  });

  factory User.fromJson(json) {
    return User(
      name: json['name'],
      username: json['username'],
      profileImage: json['profileImage'],
      lastAccessTime: json['lastAccessTime'],
      followers: json['followers'],
      following: json['following'],
      isNewUser: json['isNewUser'],
    );
  }
}
