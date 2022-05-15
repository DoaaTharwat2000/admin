import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddBaby extends StatefulWidget {
  const AddBaby({Key? key , required this.mother}) : super(key: key);
final Mother mother;
  @override
  _AddBabyState createState() => _AddBabyState();
}

class _AddBabyState extends State<AddBaby> {
  late TextEditingController babyName;
  late TextEditingController gender;
  late TextEditingController id;
  late TextEditingController dateOfBirth;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    babyName = TextEditingController();
    gender = TextEditingController();
    dateOfBirth = TextEditingController();
    id = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    babyName.dispose();
    gender.dispose();
    id.dispose();
    dateOfBirth.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Add Baby'),
  centerTitle: true,
),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15
          ,vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.baby),
                        onPressed: () { print("Pressed");
                        },
                      iconSize: 80,

                    ),
                  )],
                ),

                SizedBox(
                  height: 20,
                ),
                LoginTextField(
                    controller: babyName,
                    keyboardType: TextInputType.text,
                    label: "Baby Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height:15,
                ),    LoginTextField(
                    controller: gender,
                    keyboardType: TextInputType.text,
                    label: "Baby Gender",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height:15,
                ),  LoginTextField(
                    controller: id,
                    keyboardType: TextInputType.text,
                    label: "Id",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height:15,
                ),    LoginTextField(
                    controller: dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    label: "Date Of Birth",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height:30,
                ),
                MaterialButtonDesign(
                    pressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("S");

                        var baby = Baby(babyId: id.text,
                          name: babyName.text,
                            dateOfBirth:dateOfBirth.text,
                          gender: gender.text,
                          showTemp: true,
                          showGps: true,
                          showHeartpulse: true,
                          showYellowColor: true,
                          mother: widget.mother

                        );
                        FireStoreHelper.createBaby(baby , id.text);
                      }
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Add Baby"),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
