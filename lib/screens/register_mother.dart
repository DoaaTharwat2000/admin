import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterMother extends StatefulWidget {
  const RegisterMother({Key? key}) : super(key: key);

  @override
  _RegisterMotherState createState() => _RegisterMotherState();
}

class _RegisterMotherState extends State<RegisterMother> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController motherName;
  late TextEditingController fatherName;
  late TextEditingController motherPhone;
  late TextEditingController fatherPhone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    motherName = TextEditingController();
    fatherName = TextEditingController();
    motherPhone = TextEditingController();
    fatherPhone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    motherName.dispose();
    fatherName.dispose();
    motherPhone.dispose();
    fatherPhone.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                    controller: motherName,
                    keyboardType: TextInputType.name,
                    label: "Mother Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: fatherName,
                    keyboardType: TextInputType.name,
                    label: " Father Name",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: motherPhone,
                    keyboardType: TextInputType.phone,
                    label: "Mother Phone Number",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: fatherPhone,
                    keyboardType: TextInputType.phone,
                    label: "Father Phone Number",
                    validate: Validation().defaultValidation),
                SizedBox(
                  height: 15,
                ),
                LoginTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    validate: Validation().emailValidation),
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

                        var user = (await Auth().registerFromAdmin(
                                email.text, password.text, context))
                            as UserCredential;
                        var mother = Mother(
                          uid: user.user!.uid,
                          name: motherName.text,
                          motherPhone: motherPhone.text,
                          fatherName: fatherName.text,
                          fatherPhone: fatherPhone.text,
                          email: email.text,
                        );
                        FireStoreHelper.createMothers(mother);
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
