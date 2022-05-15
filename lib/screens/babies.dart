import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/shared/stream_design.dart';
import 'package:flutter/material.dart';

class Babies extends StatefulWidget {
  const Babies({Key? key}) : super(key: key);

  @override
  _BabiesState createState() => _BabiesState();
}

class _BabiesState extends State<Babies> {
  Baby _baby = Baby();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Babies'),
        centerTitle: true,
      ),
      body:streamDesign( FireStoreHelper.getCollection('babies'), _baby, 'baby') ,
    );
  }
}
