import 'package:bi_tracer/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.label,
    this.suffixIcon,
    required this.validate,
    this.focusNode,
  }) : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController controller;
  String label;
  String? Function(String?) validate;
  FocusNode? focusNode;
  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: visible!,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: mainColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: mainColor, width: 1),
          ),
          suffixIcon: widget.suffixIcon ??
              (isPass!
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible!;
                        });
                      },
                      icon: Icon(
                        visible! ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    )
                  : widget.suffixIcon),
          labelText: widget.label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: mainColor, width: 1),
          ),
        ),
        validator: widget.validate);
  }
}

///////////////////////////// Animated////////////////////////////////
class AnimatedLoginTextFeild extends StatefulWidget {
  AnimatedLoginTextFeild(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.label,
      this.suffixIcon,
      required this.finalwidth,
      required this.initWidth,
      required this.validate})
      : super(key: key);
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController controller;
  String label;
  String? Function(String?) validate;
  double initWidth, finalwidth;

  @override
  _AnimatedLoginTextFeildState createState() => _AnimatedLoginTextFeildState();
}

class _AnimatedLoginTextFeildState extends State<AnimatedLoginTextFeild> {
  double? animatedWidth;
  FocusNode? focusNode;
  @override
  void initState() {
    super.initState();
    animatedWidth = widget.initWidth;
    focusNode = FocusNode();
    focusNode!.addListener(() {
      if (!focusNode!.hasPrimaryFocus) {
        animatedWidth = widget.initWidth;
        setState(() {});
      } else {
        setState(() {
          animatedWidth = widget.finalwidth;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: animatedWidth,
      duration: Duration(milliseconds: 200),
      child: LoginTextField(
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        suffixIcon: widget.suffixIcon,
        label: widget.label,
        validate: widget.validate,
      ),
    );
  }
}
