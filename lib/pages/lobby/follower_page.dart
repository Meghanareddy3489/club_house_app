import '../../app_lib.dart';

class FollowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Column(
        children: [
          buildAvailableChatTitle(),
          buildAvailableChatList(context),
        ],
      ),
    );
  }

  Widget buildAvailableChatTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'AVAILABLE TO CHAT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildAvailableChatList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (lc, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FollowerItem(
            index: index,
            user: users[index],
            onProfileTap: () {
              History.pushPage(
                context,
                ProfilePage(
                  profile: users[index],
                ),
              );
            },
            onRoomButtonTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return RoomPage(
                    room: Room(
                      title: '${myProfile.name}\'s Room',
                      users: [myProfile, users[index]],
                      speakerCount: 1,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
