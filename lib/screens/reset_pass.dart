import 'package:bi_tracer/firebase/auth.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/textfield.dart';
import 'package:bi_tracer/shared/validation.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  label: "Enter Email",
                  validate: Validation().defaultValidation),
              SizedBox(
                height: 15,
              ),
              MaterialButtonDesign(
                  pressed: () {
                    if (formKey.currentState!.validate()) {
                      print("S");
                      Auth.resetPass(email.text, context);
                    }
                  },
                  minWidth: 250,
                  color: mainColor,
                  label: "Reset"),
            ],
          ),
        ),
      ),
    );
  }
}
