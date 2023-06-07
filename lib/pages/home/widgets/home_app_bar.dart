import '../../../app_lib.dart';

class HomeAppBar extends StatelessWidget {
  final User profile;
  final Function onProfileTab;

  HomeAppBar({Key? key, required this.profile, required this.onProfileTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.search),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.mail),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.calendar_today),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.notifications_active_outlined),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(
                    profile: myProfile,
                  );
                }));
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
