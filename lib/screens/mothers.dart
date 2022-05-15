import 'dart:math';

import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/login.dart';
import 'package:bi_tracer/screens/register_mother.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/stream_design.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mothers extends StatefulWidget {
  const Mothers({Key? key}) : super(key: key);

  @override
  _MothersState createState() => _MothersState();
}

class _MothersState extends State<Mothers> {
  Mother _mother = Mother();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mothers'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await Auth.logout(navigateReplacement(
                    context: context, route: const LogIn()));
              },
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                size: 20,
                color: Colors.black,
              ))
        ],
      ),
      body: streamDesign(
          FireStoreHelper.getCollection('mothers'), _mother, 'mother'),
      floatingActionButton: userType == "doctor"
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                navigate(context: context, route: RegisterMother());
              },
              label: Text('Add Mother')),
    );
  }
}
