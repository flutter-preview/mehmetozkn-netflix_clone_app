class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get projectLogo => toPng("projectLogo");

  String toJpeg(String name) => "assets/images/$name.jpeg";
  String toPng(String name) => "assets/images/$name.png";
}
