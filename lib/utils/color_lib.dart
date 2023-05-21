import 'package:flutter/material.dart';

class ColorLib {
  static final black = '#222222'.toColor();
  static final gray = '#9B9B9B'.toColor();
  static final primary = '#DB3022'.toColor();
  static final background = '#F9F9F9'.toColor();
  static final white = '#FFFFFF'.toColor();
  static final error = '#F01F0E'.toColor();
  static final success = '2AA952'.toColor();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
