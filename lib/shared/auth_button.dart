import 'package:flutter/material.dart';

Widget MaterialButtonDesign(
    {required void Function() pressed,
    required double minWidth,
    required Color color,
    required String label}) {
  return MaterialButton(
    child: Text(
      label,
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    onPressed: pressed,
    color: color,
    minWidth: minWidth,
    padding: EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(32.0),
    ),
  );
}

Widget MaterialButtonText(
    {required void Function() pressed, required String label}) {
  return MaterialButton(
    // padding: EdgeInsets.all(8.0),
    textColor: Colors.black,
    elevation: 8.0,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      ),
    ),
    // ),
    onPressed: pressed,
  );
}
