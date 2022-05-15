import 'package:bi_tracer/screens/home.dart';
import 'package:bi_tracer/screens/mothers.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
  Future registerFromAdmin(
      String email, String password, BuildContext context) async {
    FirebaseApp app = await Firebase.initializeApp(
        name: email, options: Firebase.app().options);
    try {
      UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);

      return Future.sync(() => userCredential);
    } on FirebaseAuthException catch (e) {
      // Do something with exception. This try/catch is here to make sure
      // that even if the user creation fails, app.delete() runs, if is not,
      // next time Firebase.initializeApp() will fail as the previous one was
      // not deleted.
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(snac('weak password'));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context)
            .showSnackBar(snac('email already in use'));
      }
    }

    await app.delete();
  }

///////////////////////////////////////////////
  static resetPass(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
         ScaffoldMessenger.of(context)
        .showSnackBar(snac('Check your email'));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);

      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(snac('user not found'));

        print('No user found for that email.');
      }
    }
  }
//////////////////////////////////////////////////////////////////////////////////////

  Future login(String email, String password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (userCredential != null) {
        checkLog(context, userCredential.user!.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(snac('User not found'));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(snac('Wrong Password'));
      }

      print('Wrong password provided for that user.');
    }
  }

  static logout(void fun) {
    FirebaseAuth.instance.signOut().then((value) => fun);
    userType = "";
  }
}

checkLog(BuildContext context, String uid) async {
  // Navigator.pushReplacementNamed(context, FirstScreen.id);
  final log =
      await FirebaseFirestore.instance.collection('admin').doc(uid).get();
  final log2 =
      await FirebaseFirestore.instance.collection('doctors').doc(uid).get();
  log.data() != null ? userType = "admin" : userType = "doctor";
  log.data() != null
      ? navigateReplacement(context: context, route: Home())
      : log2.data() != null
          ? navigateReplacement(context: context, route: Mothers())
          : ScaffoldMessenger.of(context).showSnackBar(snac('User not found'));
}
