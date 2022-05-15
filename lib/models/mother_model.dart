import 'dart:convert';

import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/doctor_model.dart';

class Mother {
  String? name;
  String? fatherName;
  String? motherPhone;
  String? fatherPhone;
  String? email;
  String? password;
  String? uid;
  Doctor? doctor;
  Mother({
    this.name,
    this.fatherName,
    this.motherPhone,
    this.fatherPhone,
    this.email,
    this.password,
    this.uid,
    this.doctor,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fatherName': fatherName,
      'motherPhone': motherPhone,
      'fatherPhone': fatherPhone,
      'email': email,
      'password': password,
      'uid': uid,
      'doctor': doctor?.toMap(),
    };
  }

  factory Mother.fromMap(Map<String, dynamic> map) {
    return Mother(
      name: map['name'] != null ? map['name'] : null,
      fatherName: map['fatherName'] != null ? map['fatherName'] : null,
      motherPhone: map['motherPhone'] != null ? map['motherPhone'] : null,
      fatherPhone: map['fatherPhone'] != null ? map['fatherPhone'] : null,
      email: map['email'] != null ? map['email'] : null,
      password: map['password'] != null ? map['password'] : null,
      uid: map['uid'] != null ? map['uid'] : null,
      doctor: map['doctor'] != null ? Doctor.fromMap(map['doctor']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mother.fromJson(String source) => Mother.fromMap(json.decode(source));

  Mother copyWith({
    String? name,
    String? fatherName,
    String? motherPhone,
    String? fatherPhone,
    String? email,
    String? password,
    String? uid,
    Doctor? doctor,
  }) {
    return Mother(
      name: name ?? this.name,
      fatherName: fatherName ?? this.fatherName,
      motherPhone: motherPhone ?? this.motherPhone,
      fatherPhone: fatherPhone ?? this.fatherPhone,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      doctor: doctor ?? this.doctor,
    );
  }
}
