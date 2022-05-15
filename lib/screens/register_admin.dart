import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/doctor_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/snacbar.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({Key? key}) : super(key: key);

  @override
  _RegisterAdminState createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController adminName;
  late TextEditingController emailAdress;
  late TextEditingController specialization;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adminName = TextEditingController();
    emailAdress = TextEditingController();
    specialization = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    adminName.dispose();
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
        title: Text("Admin"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextField(
                    controller: adminName,
                    keyboardType: TextInputType.name,
                    label: "Admin Name",
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
                        var user = (await Auth().registerFromAdmin(
                                emailAdress.text, password.text, context))
                            as UserCredential;

                        FireStoreHelper.firestore
                            .collection('admin')
                            .doc(user.user!.uid)
                            .set({
                          'name': adminName.text,
                          'email': emailAdress.text,
                          'specialization': specialization.text,
                          'uid': user.user!.uid,
                        }).then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snac('email successfully added'));
                          adminName.clear();
                          emailAdress.clear();
                          specialization.clear();
                          password.clear();
                          confirmPassword.clear();
                        });
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
