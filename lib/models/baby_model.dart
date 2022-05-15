import 'dart:convert';

import 'package:bi_tracer/models/mother_model.dart';

class Baby {
  String? name;
  String? motion;
  String? oxygen;

  String? dateOfBirth;
  String? gender;
  String? temp;
  String? lattude;
  String? longtude;
  String? heartPulse;
  String? yellowColor;
  String? camera;
  String? babyId;
  bool? showTemp;
  bool? showGps;
  bool? showHeartpulse;
  bool? showYellowColor;
  bool? showCamera;
  Mother? mother;
  Baby({
    this.name,
    this.motion,
    this.oxygen,
    this.dateOfBirth,
    this.gender,
    this.temp,
    this.lattude,
    this.longtude,
    this.heartPulse,
    this.yellowColor,
    this.camera,
    this.babyId,
    this.showTemp,
    this.showGps,
    this.showHeartpulse,
    this.showYellowColor,
    this.showCamera,
    this.mother,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'motion': motion,
      'oxygen': oxygen,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'temp': temp,
      'lattude': lattude,
      'longtude': longtude,
      'heartPulse': heartPulse,
      'yellowColor': yellowColor,
      'camera': camera,
      'babyId': babyId,
      'showTemp': showTemp,
      'showGps': showGps,
      'showHeartpulse': showHeartpulse,
      'showYellowColor': showYellowColor,
      'showCamera': showCamera,
      'mother': mother?.toMap(),
    };
  }

  factory Baby.fromMap(Map<String, dynamic> map) {
    return Baby(
      name: map['name'],
      motion: map['motion'],
      oxygen: map['oxygen'],
      dateOfBirth: map['dateOfBirth'],
      gender: map['gender'],
      temp: map['temp'],
      lattude: map['lattude'],
      longtude: map['longtude'],
      heartPulse: map['heartPulse'],
      yellowColor: map['yellowColor'],
      camera: map['camera'],
      babyId: map['babyId'],
      showTemp: map['showTemp'],
      showGps: map['showGps'],
      showHeartpulse: map['showHeartpulse'],
      showYellowColor: map['showYellowColor'],
      showCamera: map['showCamera'],
      mother: map['mother'] != null ? Mother.fromMap(map['mother']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Baby.fromJson(String source) => Baby.fromMap(json.decode(source));

  Baby copyWith({
    String? name,
    String? dateOfBirth,
    String? gender,
    String? temp,
    String? lattude,
    String? longtude,
    String? heartPulse,
    String? yellowColor,
    String? camera,
    String? babyId,
    bool? showTemp,
    bool? showGps,
    bool? showHeartpulse,
    bool? showYellowColor,
    bool? showCamera,
    Mother? mother,
  }) {
    return Baby(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      temp: temp ?? this.temp,
      lattude: lattude ?? this.lattude,
      longtude: longtude ?? this.longtude,
      heartPulse: heartPulse ?? this.heartPulse,
      yellowColor: yellowColor ?? this.yellowColor,
      camera: camera ?? this.camera,
      babyId: babyId ?? this.babyId,
      showTemp: showTemp ?? this.showTemp,
      showGps: showGps ?? this.showGps,
      showHeartpulse: showHeartpulse ?? this.showHeartpulse,
      showYellowColor: showYellowColor ?? this.showYellowColor,
      showCamera: showCamera ?? this.showCamera,
      mother: mother ?? this.mother,
    );
  }
}
