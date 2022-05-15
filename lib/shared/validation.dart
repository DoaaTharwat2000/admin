import 'package:bi_tracer/models/mother_model.dart';

class Validation {
  String? emailValidation(value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);
    if (value!.isEmpty) {
      return ('Please, Enter Email');
    } else if (!regExp.hasMatch(value)) {
      return ('Please, Enter Valid Email');
    } else
      return null;
  }

  String? passwordValidation(value) {
    if (value!.isEmpty || value.length < 8) {
      return ('Password must be more 8 letter');
    } else
      return null;
  }

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty || value.length < 8) {
      return ('Password must be more 8 letter');
    } else if (password != value) {
      return ('Passwords do not match');
    } else
      return null;
  }
  String?  defaultValidation
 (value) {
    if (value!.isEmpty) {
      return ('This Field must not be empty');
    } else
      return null;
  }
}

