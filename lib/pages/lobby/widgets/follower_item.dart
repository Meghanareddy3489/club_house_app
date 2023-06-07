import '../../../app_lib.dart';

class FollowerItem extends StatelessWidget {
  User? user;
  Function onProfileTap;
  Function onRoomButtonTap;
  int index;

  FollowerItem(
      {Key? key,
      this.user,
      required this.index,
      required this.onProfileTap,
      required this.onRoomButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            History.pushPage(
              context,
              ProfilePage(
                profile: users[index],
              ),
            );
          },
          child: RoundImage(
            path: user!.profileImage,
            borderRadius: 15,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${user!.lastAccessTime!}',
                style: const TextStyle(
                  color: Style.DarkBrown,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 25,
          child: RoundButton(
            text: '',
            fontSize: 10,
            disabledColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            onPressed: onRoomButtonTap,
            color: Style.LightGrey,
            isCircle: false,
            minimumHeight: 0,
            minimumWidth: 0,
            child: Row(
              children: const [
                Text(
                  '+ Room',
                  style: TextStyle(
                    color: Style.AccentBlue,
                  ),
                ),
                Icon(
                  Icons.lock,
                  color: Style.AccentBlue,
                  size: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
