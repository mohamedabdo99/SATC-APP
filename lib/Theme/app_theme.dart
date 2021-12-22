import 'package:flutter/material.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';

AppTheme(){
  return ThemeData(
    primaryColor: Themes.Primary_Lite,
    accentColor: Themes.Primary_Accent,
    primaryColorDark: Themes.Primary,
    primaryColorLight: Themes.Primary_Lite,
    scaffoldBackgroundColor: Themes.Background,
    appBarTheme: AppBarTheme(
      color: Themes.Primary
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: FontWeight.w800),
        headline2: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size_Big,
            fontWeight: FontWeight.bold
        ),
        bodyText1: TextStyle(
            color: Themes.Text_Color, fontSize: Dimension.Text_Size,fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size_Small,fontWeight: FontWeight.normal),
        headline6: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size_Small_Extra,fontWeight: FontWeight.normal)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Themes.Primary_Lite,
      backgroundColor: Themes.Primary,
      unselectedItemColor: Colors.grey,
    ),
  );
}