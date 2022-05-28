import 'dart:ui';

class ColorManager {
  static Color whiteColor = HexaColor.fromHexa("#FFFFFF");
  static Color textColor = HexaColor.fromHexa("#9EA3B8");
  static Color btnColor = HexaColor.fromHexa("#703081");
}

extension HexaColor on Color {
  static Color fromHexa(hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
