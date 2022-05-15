import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/screens/register_doctor.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/stream_design.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  Doctor _doctor = Doctor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        centerTitle: true,
      ),
      body:streamDesign( FireStoreHelper.getCollection('doctors'), _doctor, 'doctor') ,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        navigate(context: context, route:RegisterDoctor() );
      }, label: Text('Add Doctor')),
    );
  }
}
