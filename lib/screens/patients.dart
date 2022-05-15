import 'dart:math';

import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/mother_details.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Patients extends StatelessWidget {
  Patients({Key? key, required this.doctor}) : super(key: key);
  Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mothers'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FireStoreHelper.getMothersbyDoctor(doctor),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data!.docs
                  .map((e) => Mother.fromMap(e.data() as Map<String, dynamic>))
                  .toList();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      onTap: () {
                        navigate(
                            context: context,
                            route: MotherDetails(mother: list[index]));
                      },
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.primaries[min(list[index].name!.length, 17)],
                        child: Text(list[index].name![0].toUpperCase()),
                      ),
                      title: Text(list[index].name!),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
    ;
  }
}
