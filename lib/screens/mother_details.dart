import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/add_baby.dart';
import 'package:bi_tracer/screens/mother_babies.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MotherDetails extends StatelessWidget {
  MotherDetails({Key? key, required this.mother}) : super(key: key);
  Mother mother;
  @override
  Widget build(BuildContext context) {
    /*  mother = Mother(
      email: "sdsd@gmail.com",
      name: "sara ahmed ",
      fatherName: "ahmed",
      fatherPhone: "010123123",
      motherPhone: "0123124124",
    ); */
    return Scaffold(
      appBar: AppBar(
        title: Text("Mother Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                        color: mainColor,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.female,
                                color: Colors.white,
                                size: 40,
                              ),
                              myText(mother.name!.toUpperCase(),
                                  size: 30, color: Colors.white),
                            ],
                          ),
                        ))),
                ListTile(
                  title: Text("Mother number"),
                  trailing: FaIcon(FontAwesomeIcons.phone),
                  subtitle: Text(mother.motherPhone!),
                ),
                Divider(),
                ListTile(
                  trailing: FaIcon(FontAwesomeIcons.envelope),
                  title: Text("Mother Email"),
                  subtitle: Text(mother.email!),
                ),
                Divider(),
                ListTile(
                  title: Text("Husband Name"),
                  trailing: FaIcon(FontAwesomeIcons.male),
                  subtitle: Text(mother.fatherName!),
                ),
                Divider(),
                ListTile(
                  trailing: FaIcon(FontAwesomeIcons.phone),
                  title: Text("Husband Number"),
                  subtitle: Text(mother.fatherPhone!),
                ),
                Divider(),
                MaterialButtonDesign(
                    pressed: () {
                      navigate(
                          context: context,
                          route: MotherBabies(mother: mother));
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Babies"),
                MaterialButtonDesign(
                    pressed: () {
                      navigate(
                          context: context,
                          route: AddBaby(
                            mother: mother,
                          ));
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Add Baby"),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
