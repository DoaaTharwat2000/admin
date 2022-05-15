import 'dart:convert';

import 'package:bi_tracer/models/mother_model.dart';

class Doctor {
  String? name;
  String? phoneNumber;
  String? adress;
  String? uid;
  String? emailAdress;
  String? specialization;
  String? password;
  String? confirmPassword;
  Doctor({
    this.name,
    this.phoneNumber,
    this.adress,
    this.uid,
    this.emailAdress,
    this.specialization,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'adress': adress,
      'uid': uid,
      'emailAdress': emailAdress,
      'specialization': specialization,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] != null ? map['name'] : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] : null,
      adress: map['adress'] != null ? map['adress'] : null,
      uid: map['uid'] != null ? map['uid'] : null,
      emailAdress: map['emailAdress'] != null ? map['emailAdress'] : null,
      specialization:
          map['specialization'] != null ? map['specialization'] : null,
      password: map['password'] != null ? map['password'] : null,
      confirmPassword:
          map['confirmPassword'] != null ? map['confirmPassword'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));

  Doctor copyWith({
    String? name,
    String? phoneNumber,
    String? adress,
    String? uid,
    String? emailAdress,
    String? specialization,
    String? password,
    String? confirmPassword,
  }) {
    return Doctor(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      adress: adress ?? this.adress,
      uid: uid ?? this.uid,
      emailAdress: emailAdress ?? this.emailAdress,
      specialization: specialization ?? this.specialization,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
