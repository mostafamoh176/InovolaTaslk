class DifferenSize{
  static const double appWidth=1080;
  static const double appHeight=2728;
  static const double carousalHeight=675;
  static const double carousalWidth=1080;
}
class CommonUse{
  static const String BASE_URL="https://run.mocky.io/";
  static const String END_POINT="v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34";
}

extension NumberParsing on String {
  double toDouble() {
    return double.parse(this);
  }
}