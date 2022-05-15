import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebDesign extends StatelessWidget {
  WebDesign({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Center(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(child: Container(width: 500, child: child)),
          ))
        : child;
  }
}
