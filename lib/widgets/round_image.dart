import '../app_lib.dart';

class RoundImage extends StatelessWidget {
  String url;
  String path;
  double? width;
  double? height;
  EdgeInsets? margin;
  double borderRadius;

  RoundImage(
      {Key? key,
      this.url =
          "https://media.istockphoto.com/photos/adorable-welsh-corgi-pembroke-on-green-lawn-at-home-picture-id1077145200?s=612x612",
      this.path = "assets/images/logo.png",
      this.margin,
      this.width = 40,
      this.height = 40,
      this.borderRadius = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
