
import 'package:flutter/material.dart';

Widget defaultTextButton({
  Color background = Colors.blue,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double radius = 4.0,
  required Function function,
  required String text,
}) =>
    TextButton(
      style: ButtonStyle(
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
    );