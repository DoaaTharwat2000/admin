import 'dart:math';

import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/babies_details.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MotherBabies extends StatelessWidget {
  MotherBabies({Key? key, required this.mother}) : super(key: key);
  Mother mother;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FireStoreHelper.getBabysforMother(mother),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          // TODO: do something with the data
          final list = snapshot.data!.docs
              .map((e) => Baby.fromMap(e.data() as Map<String, dynamic>))
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Babies'),
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    onTap: () {
                      navigate(
                          context: context,
                          route: BabyDetails(baby: list[index]));
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
            ),
          );
        } else if (snapshot.hasError) {
          // TODO: do something with the error
          return Text(snapshot.error.toString());
        }
        // TODO: the data is not ready, show a loading indicator
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
