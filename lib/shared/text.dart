import 'package:flutter/material.dart';

Widget myText(String text,
    {required double size, Color? color, FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight ?? FontWeight.normal,
    ),
  );
}
