import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
void navigate({required BuildContext context, required Widget route}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}void navigateReplacement({required BuildContext context, required Widget route}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

