import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterDoctor extends StatefulWidget {
  const RegisterDoctor({Key? key}) : super(key: key);

  @override
  _RegisterDoctorState createState() => _RegisterDoctorState();
}

class _RegisterDoctorState extends State<RegisterDoctor> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController doctorName;
  late TextEditingController PhoneNumber;
  late TextEditingController adress;
  late TextEditingController emailAdress;
  late TextEditingController specialization;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorName = TextEditingController();
    PhoneNumber = TextEditingController();
    adress = TextEditingController();
    emailAdress = TextEditingController();
    specialization = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    doctorName.dispose();
    PhoneNumber.dispose();
    adress.dispose();
    emailAdress.dispose();
    specialization.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Register"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                    controller: doctorName,
                    keyboardType: TextInputType.name,
                    label: "Doctor Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: PhoneNumber,
                    keyboardType: TextInputType.phone,
                    label: "Phone Number",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: adress,
                    keyboardType: TextInputType.text,
                    label: "Adress",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: emailAdress,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email Adress",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: specialization,
                    keyboardType: TextInputType.text,
                    label: "Specialization",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    label: "Password",
                    validate: Validation().passwordValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    label: "Confirm Password",
                    validate: (s) {
                      return Validation()
                          .confirmPasswordValidation(s, password.text);
                    }),
                SizedBox(
                  height: 15,
                ),
                MaterialButtonDesign(
                    pressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("S");
                        var user = (Auth().registerFromAdmin(
                                emailAdress.text, password.text, context))
                            as UserCredential;
                        var doctor = Doctor(
                          uid: user.user!.uid,
                          name: doctorName.text,
                          phoneNumber: PhoneNumber.text,
                          adress: adress.text,
                          emailAdress: emailAdress.text,
                          specialization: specialization.text,
                        );
                        FireStoreHelper.createDoctor(doctor);
                      }
                    },
                    minWidth: 300,
                    color: mainColor,
                    label: "Register"),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
