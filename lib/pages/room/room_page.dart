import '../../app_lib.dart';

class RoomPage extends StatelessWidget {
  Room? room;

  RoomPage({Key? key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: Style.AccentBlue,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'All rooms',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                History.pushPage(
                  context,
                  ProfilePage(
                    profile: myProfile,
                  ),
                );
              },
              child: RoundImage(
                path: myProfile.profileImage,
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 80,
                top: 20,
              ),
              child: Column(
                children: [
                  buildTitle(room!.title),
                  const SizedBox(
                    height: 30,
                  ),
                  buildSpeakers(room!.users.sublist(0, room!.speakerCount)),
                  buildOthers(room!.users.sublist(0, room!.count)),
                  //
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottom(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }

  Widget buildSpeakers(List<User> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150,
      ),
      itemCount: users.length,
      itemBuilder: (gc, index) {
        return RoomProfile(
          user: users[index],
          isModerator: index == 0,
          isMute: index == 3,
          size: 80,
        );
      },
    );
  }

  Widget buildOthers(List<User> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Others in the room',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 100,
          ),
          itemCount: users.length,
          itemBuilder: (gc, index) {
            return RoomProfile(
              user: users[index],
              size: 60,
            );
          },
        ),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          RoundButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Style.LightGrey,
            text: "",
            fontSize: 0,
            disabledColor: Colors.white,
            padding: const EdgeInsets.only(
              left: 0.0,
            ),
            isCircle: false,
            minimumHeight: 0.0,
            minimumWidth: 0.0,
            child: const Text(
              '✌️ Leave quietly',
              style: TextStyle(
                backgroundColor: Style.LightGreen,
                color: Style.AccentRed,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          RoundButton(
            onPressed: () {},
            text: "",
            fontSize: 0,
            disabledColor: Colors.white,
            padding: const EdgeInsets.only(
              left: 0.0,
              right: 20.0,
            ),
            minimumHeight: 0.0,
            minimumWidth: 0.0,
            color: Colors.white,
            isCircle: true,
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
          RoundButton(
            onPressed: () {},
            text: "",
            fontSize: 0,
            disabledColor: Colors.white,
            padding: const EdgeInsets.only(
              left: 0.0,
            ),
            minimumHeight: 0.0,
            minimumWidth: 0.0,
            color: Colors.white,
            isCircle: true,
            child: const Icon(
              Icons.thumb_up,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
