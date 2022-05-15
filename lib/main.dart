import 'package:bi_tracer/screens/login.dart';
import 'package:bi_tracer/screens/splash_screen.dart';

import 'package:bi_tracer/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  kIsWeb
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyC2IkRd-7QdQ2AhJhhNgbmxfXfw30hYOBk",
            appId: "1:425507352046:web:d7ab2058abab3f652cb2ff",
            messagingSenderId: "425507352046",
            projectId: "bi-trace-ff9cd",
            storageBucket: "bi-trace-ff9cd.appspot.com",
          ),
        )
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bi-Tracer',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black)),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: mainColor),
      home: SplashScreen(),
    );
  }
}
