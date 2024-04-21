import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll("#", "");
    if(color.length == 6) {
      color = "FF$color";
    }
    return Color(int.parse(color, radix: 16));
  }
}

class ColorManager {
  static Color black = HexColor.hexString("#000000");
  static Color white = HexColor.hexString("#FFFFFF");
  static Color purple = HexColor.hexString("#660066");
  static Color mable = HexColor.hexString("#d4eff4");
  static Color bizarre = HexColor.hexString("#f2dee0");
  static Color zanah = HexColor.hexString("#def0d8");
  static Color azreishWhite = HexColor.hexString("#d9edf6");
  static Color bermudaGray = HexColor.hexString("#567c85");
  static Color mischka = HexColor.hexString("#d3d3dd");
}