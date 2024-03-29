import '../../../app_lib.dart';

class LobbyBottomSheet extends StatefulWidget {
  final Function onButtonTap;

  const LobbyBottomSheet({Key? key, required this.onButtonTap})
      : super(key: key);

  @override
  _LobbyBottomSheetState createState() => _LobbyBottomSheetState();
}

class _LobbyBottomSheetState extends State<LobbyBottomSheet> {
  var selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            alignment: Alignment.centerRight,
            child: const Text(
              '+ Add a Topic',
              style: TextStyle(
                color: Style.AccentBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0, len = 3; i < len; i++)
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = i;
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: i == selectedButtonIndex
                            ? Style.SelectedItemGrey
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: i == selectedButtonIndex
                              ? Style.SelectedItemBorderGrey
                              : Colors.transparent,
                        )),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: RoundImage(
                            width: 80,
                            height: 80,
                            borderRadius: 20,
                            path: lobbyBottomSheets[i]['image'],
                          ),
                        ),
                        Text(
                          lobbyBottomSheets[i]['text'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const Divider(
            thickness: 1,
            height: 60,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            lobbyBottomSheets[selectedButtonIndex]['selectedMessage'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundButton(
            text: '',
            fontSize: 8,
            color: Style.AccentBlue,
            disabledColor: Style.AccentBlue,
            padding: const EdgeInsets.all(15),
            onPressed: () {
              History.pushPage(context, HomePage());
            },
            //widget.onButtonTap,
            child: Text('🎉 Let\'s go'),
            isCircle: false,
            minimumHeight: 0.0,
            minimumWidth: 0.0,
          )
        ],
      ),
    );
  }
}
