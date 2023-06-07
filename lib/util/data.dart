import 'dart:math';
import 'package:club_house_app/models/room.dart';
import 'package:club_house_app/models/user.dart';

Random random = Random();

String dummyText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠';

// User
List clubname = [
  "English Language: 🎤 practice English 24/7",
  "🎉New Game🎉",
  "It's Morning✨",
  "T20 2022 Preview🏏",
  "CH Theatre ✨-A musical🎵🎼🎶🎤😍",
  "Motivation Talks",
  "Let's Celebrate WORLD POETRY DAY 2022💝",
  "ACTIVATE & SOAR🐓",
  "Wake it up !in the Morning Show",
  "Daily Talks😜",
];
List names = [
  'American Bobtail',
  'British Shorthair',
  'Cornish Rex',
  'Egyptian Mau',
  'Devon Rex',
  'Exotic Shorthair',
  'Japanese Bobtail',
  'Maine Coon',
  'Scottish Fold',
  'Selkirk Rex',
  'American Bobtail2',
  'British Shorthair2',
  'Cornish Rex2',
  'Egyptian Mau2',
  'Devon Rex2',
  'Exotic Shorthair2',
  'Japanese Bobtail2',
  'Maine Coon2',
  'Scottish Fold2',
  'Selkirk Rex2',
];

List pic = [
  "assets/images/pic1.png",
  "assets/images/pic2.png",
  "assets/images/pic3.png",
  "assets/images/pic4.png",
  "assets/images/pic5.png",
  "assets/images/pic6.png",
  "assets/images/pic7.png",
  "assets/images/pic8.png",
  "assets/images/pic9.png",
  "assets/images/pic10.png",
  // "assets/images/pic1.png",
];

List userData = List.generate(
  20,
  (index) => {
    'name': names[index],
    'username': '@${names[index].toString().split(' ')[0].toLowerCase()}',
    //'profileImage': pic[index],
    'profileImage': 'assets/images/pic${index % 10 + 1}.png',
    'followers': '1k',
    'following': '1',
    'lastAccessTime': '${index + 10}m',
    'isNewUser': random.nextBool(),
  },
);
//'profileImage': 'assets/images/cat${index % 10 + 1}.jpg',

// MyProfile
dynamic profileData = {
  'name': 'Meghana Palugulla',
  'username': '@meghana12',
  'profileImage': 'assets/images/profile.png',
  'followers': '1k',
  'following': '1',
  'lastAccessTime': '0m',
  'isNewUser': random.nextBool(),
};

// Room
List roomData = List.generate(
  10,
  (index) => {
    'title': clubname[index],
    "users": List.generate(20, (index) => User.fromJson(userData[index]))
      ..shuffle(),
    'speakerCount': 4,
    'count': 20,
  },
);

List<Room> rooms = List.generate(
  10,
  (index) => Room.fromJson(roomData[index]),
);

List lobbyBottomSheets = [
  {
    'image': 'assets/images/open.png',
    'text': 'Open',
    'selectedMessage': 'Start a room open to everyone',
  },
  {
    'image': 'assets/images/social.png',
    'text': 'Social',
    'selectedMessage': 'Start a room with people I follow',
  },
  {
    'image': 'assets/images/closed.png',
    'text': 'Closed',
    'selectedMessage': 'Start a room for people I choose',
  },
];

List<User> users = List.generate(20, (index) => User.fromJson(userData[index]));
User myProfile = User.fromJson(profileData);
User userProfile = User.fromJson(userData);
