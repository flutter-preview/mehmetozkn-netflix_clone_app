class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get projectLogo => toPng("projectLogo");
  String get onboard_1 => toPng("onboard_1");
  String get onboard_2 => toPng("onboard_2");
  String get onboard_3 => toPng("onboard_3");

  String toJpeg(String name) => "assets/images/$name.jpeg";
  String toPng(String name) => "assets/images/$name.png";
}
