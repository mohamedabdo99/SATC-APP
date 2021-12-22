import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 60.0,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double radius = 4.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background),
        ),
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );