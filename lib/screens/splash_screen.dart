import 'dart:async';

import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/screens/login.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogIn()));
      } else {
        // Navigator.pushReplacementNamed(context, FirstScreen.id);

        checkLog(context, FirebaseAuth.instance.currentUser!.uid);

        //  print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.png",
            filterQuality: FilterQuality.high,
            height: 200,
          ),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
