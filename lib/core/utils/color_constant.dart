import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color cyanA200 = fromHex('#00ffe0');

  static Color deepPurple900 = fromHex('#2803bb');

  static Color gray80001 = fromHex('#45464f');

  static Color green800 = fromHex('#0da300');

  static Color deepPurple100 = fromHex('#d0bcff');

  static Color green600 = fromHex('#2bb439');

  static Color limeA400 = fromHex('#cbff00');

  static Color black900 = fromHex('#000000');

  static Color blueGray800 = fromHex('#4a4458');

  static Color lightBlueA700 = fromHex('#0084ff');

  static Color redA700 = fromHex('#ff0000');

  static Color purple600 = fromHex('#9c00a9');

  static Color black9004c = fromHex('#4c000000');

  static Color gray600 = fromHex('#767680');

  static Color gray700 = fromHex('#595d72');

  static Color gray400 = fromHex('#c6c5d0');

  static Color gray500 = fromHex('#938f99');

  static Color blueGray100 = fromHex('#cac4d0');

  static Color blue800 = fromHex('#004be5');

  static Color gray800 = fromHex('#49454f');

  static Color gray900 = fromHex('#1b1b1f');

  static Color gray90001 = fromHex('#1c1b1f');

  static Color blueGray500 = fromHex('#72768b');

  static Color deepPurple90001 = fromHex('#2803bc');

  static Color gray300 = fromHex('#e6e1e5');

  static Color blueGray80001 = fromHex('#424659');

  static Color gray30001 = fromHex('#e4e1e6');

  static Color deepPurple50 = fromHex('#e8def8');

  static Color indigo90001 = fromHex('#001551');

  static Color indigo90002 = fromHex('#002681');

  static Color blue300 = fromHex('#68b6e7');

  static Color indigo900 = fromHex('#381e72');

  static Color blue100 = fromHex('#b7c4ff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
