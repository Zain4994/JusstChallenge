import 'dart:ui';

import 'package:flutter/material.dart';

enum JusstChallangeAppColor {
  Blue,
  White,
  DarkBlue,
  BackgroundBlue,
  LightBlue,
  Red,
  Orange,
  DarkGrey,
  LightGrey,
  VeryDarkGrey,
  Pink,
  Grey,
  SubtitleColor,
  LightBlack,
  Black,
  Yellow
}

extension AppColorGetter on JusstChallangeAppColor {
  Color getColor() {
    switch (this) {
      case JusstChallangeAppColor.Blue:
        return HexColor.fromHex("#0CBDBD");
        break;
      case JusstChallangeAppColor.Red:
        return HexColor.fromHex("#FF8484");
        break;
      case JusstChallangeAppColor.Orange:
        return HexColor.fromHex("#F29A4C");
        break;
      case JusstChallangeAppColor.DarkGrey:
        return HexColor.fromHex("#5E5E5E");
        break;
      case JusstChallangeAppColor.LightGrey:
        return HexColor.fromHex("#F4F4F4");
        break;
      case JusstChallangeAppColor.Pink:
        return HexColor.fromHex("#FF8484");
      case JusstChallangeAppColor.Grey:
        return HexColor.fromHex("#B0B0B0");
        break;
      case JusstChallangeAppColor.SubtitleColor:
        return HexColor.fromHex("#5D5D5D");
        break;
      case JusstChallangeAppColor.LightBlack:
        return HexColor.fromHex("#1C1C1C").withOpacity(0.5);
        break;
      case JusstChallangeAppColor.Black:
        return HexColor.fromHex("#1C1C1C");
        break;
      case JusstChallangeAppColor.Yellow:
        return HexColor.fromHex("#EAC00E");
        break;
      case JusstChallangeAppColor.DarkBlue:
        return HexColor.fromHex("#4477A7");
        break;
      case JusstChallangeAppColor.LightBlue:
        return HexColor.fromHex("#56CCF2");
        break;
      case JusstChallangeAppColor.BackgroundBlue:
        return HexColor.fromHex("#B0DEDE");
        break;
      case JusstChallangeAppColor.VeryDarkGrey:
        return HexColor.fromHex("#818181");
        break;
      case JusstChallangeAppColor.White:
        return Colors.white;
        break;
    }
    return Colors.white;
  }
}

///Gets color depending on the first char
Color getSuitableColor([String word]) {
  if (word == null || word.isEmpty)
    return JusstChallangeAppColor.DarkBlue.getColor();

  int firstCharCodeUnit = word.toLowerCase().codeUnitAt(0);

  if (firstCharCodeUnit >= 97 && firstCharCodeUnit < 103) {
    return JusstChallangeAppColor.Pink.getColor();
  } else if (firstCharCodeUnit >= 103 && firstCharCodeUnit < 109) {
    return JusstChallangeAppColor.Yellow.getColor();
  } else if (firstCharCodeUnit >= 109 && firstCharCodeUnit <= 115) {
    return JusstChallangeAppColor.Blue.getColor();
  } else if (firstCharCodeUnit >= 115 && firstCharCodeUnit <= 122) {
    return JusstChallangeAppColor.DarkBlue.getColor();
  } else {
    return JusstChallangeAppColor.DarkBlue.getColor();
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
