import '../app_lib.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final Function onPressed;
  final Widget child;
  final bool isCircle;
  final double minimumWidth;
  final double minimumHeight;

  RoundButton({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.disabledColor,
    required this.padding,
    required this.onPressed,
    required this.child,
    required this.isCircle,
    required this.minimumHeight,
    required this.minimumWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(Size(minimumWidth, minimumHeight)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledColor;
            }
            return color;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          isCircle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        elevation: MaterialStateProperty.all<double>(0.5),
      ),
      //onPressed: ,
      onPressed: () {},
      child: text.isNotEmpty
          ? Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
              ),
            )
          : child,
    );
  }
}
