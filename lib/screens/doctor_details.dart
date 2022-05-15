import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/screens/add_patient.dart';
import 'package:bi_tracer/screens/patients.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/navigator.dart';
import 'package:bi_tracer/shared/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatelessWidget {
  DoctorDetails({Key? key, required this.doctor}) : super(key: key);
  Doctor doctor;
  @override
  Widget build(BuildContext context) {
    /*   doctor = Doctor(
      emailAdress: "sdsd@gmail.com",
      name: "sara ahmed ",
      specialization: "ahmed",
      phoneNumber: "010123123",
    ); */
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Profile"),
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
                                FontAwesomeIcons.userMd,
                                color: Colors.white,
                                size: 40,
                              ),
                              myText("Dr. " + doctor.name!.toUpperCase(),
                                  size: 30, color: Colors.white),
                            ],
                          ),
                        ))),
                ListTile(
                  title: Text("Doctor number"),
                  trailing: FaIcon(FontAwesomeIcons.phone),
                  subtitle: Text(doctor.phoneNumber ?? "no phone"),
                ),
                Divider(),
                ListTile(
                  trailing: FaIcon(FontAwesomeIcons.envelope),
                  title: Text("Doctor Email"),
                  subtitle: Text(doctor.emailAdress ?? "no adress"),
                ),
                Divider(),
                ListTile(
                  title: Text("Doctor Specialization"),
                  trailing: FaIcon(FontAwesomeIcons.male),
                  subtitle: Text(doctor.specialization ?? "no spec"),
                ),
                Divider(),
                MaterialButtonDesign(
                    pressed: () {
                      navigate(
                          context: context, route: Patients(doctor: doctor));
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Patients"),
                Divider(),
                MaterialButtonDesign(
                    pressed: () {
                      navigate(
                          context: context, route: AddPatient(doctor: doctor));
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Add Patients"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
