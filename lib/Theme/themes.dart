import 'dart:ui';

import 'package:flutter/material.dart';

class Themes{
  static Color Primary=Color(int.parse('#206A4E'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Lite=Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Dark=Color(int.parse('#2661FA'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Accent=Color(int.parse('#002b83'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Background=Color(int.parse('#F2F2F2'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Icon_Color=Color(int.parse('#ffffff'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Highlite_Text_Color=Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Text_Color=Color(int.parse('#2B2B2B'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color TextField_Error_Color=Color(int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Button_Color1=Color(int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Button_Color2=Color(int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color DropDown=Color(int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Curve_Color=Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color White=Colors.white;
  static Color Grey=Colors.grey;
  static Color Rating_Color=Color(0xFFF3C107);

  static Color Green=Colors.green;
  static Color Red=Colors.red;

  static Color TexftFieldBorder=Color(0xFFDDE2E5);

  static Color Yellow=Colors.yellow;

  static Color Drawe_Color=Color(0xFF292929);

  static getColorFromColorCode(String code){
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}