import 'package:bi_tracer/firebase/firestore.dart';
import 'package:bi_tracer/models/baby_model.dart';
import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/shared/auth_button.dart';
import 'package:bi_tracer/shared/constants.dart';
import 'package:bi_tracer/shared/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BabyDetails extends StatelessWidget {
  BabyDetails({Key? key, required this.baby}) : super(key: key);
  Baby baby;

  //  Future<void> loc() async {
  //                             const url =
  //                                 'https://www.google.com/maps/search/?api=1&query=${baby.lattude},${baby.longtude}';
  //                             if (await canLaunch(url)) {
  //                               print('done');
  //                               await launch(url);
  //                             } else {
  //                               throw 'Could not launch $url';
  //                             }
  //                           }
  @override
  Widget build(BuildContext context) {
    /* baby = Baby(
        gender: "female",
        name: "sara ahmed ",
        temp: "12",
        heartPulse: "1231",
        mother: Mother(
          email: "sdsd@gmail.com",
          name: "sara ahmed ",
          fatherName: "ahmed",
          fatherPhone: "010123123",
          motherPhone: "0123124124",
        ),
        yellowColor: "20",
        showTemp: false,
        showGps: false,
        showYellowColor: false,
        showHeartpulse: false,
        showCamera: true);
 */
    return StreamBuilder<DocumentSnapshot>(
        stream: //null,
            FireStoreHelper.getBabyDataById(baby.babyId!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final baby =
              Baby.fromMap(snapshot.data!.data() as Map<String, dynamic>);

          bool s = baby.showCamera ?? true;
          return Scaffold(
            appBar: AppBar(
              title: Text("Baby Profile"),
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
                                      FontAwesomeIcons.baby,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    myText(baby.name!.toUpperCase(),
                                        size: 30, color: Colors.white),
                                  ],
                                ),
                              ))),
                      ListTile(
                        title: Text("Baby Temp"),
                        trailing: IconButton(
                            onPressed: () {
                              FireStoreHelper.showOrNot(
                                  baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.temperatureLow,
                              color: baby.showTemp! ? mainColor : null,
                            )),
                        subtitle: Text(baby.temp ?? "Nodata"),
                      ),
                      ListTile(
                        title: Text("Motion"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.run_circle_outlined,
                              color: mainColor,
                            )),
                        subtitle: Text(baby.motion ?? "Nodata"),
                      ),
                      Divider(),
                      ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              FireStoreHelper.showOrNot(baby.babyId,
                                  "showYellowColor", !baby.showYellowColor!);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.babyCarriage,
                              color: baby.showYellowColor! ? mainColor : null,
                            )),
                        title: Text("Baby Jaundice"),
                        subtitle: Text(baby.yellowColor ?? "Nodata" + "%"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Heart Rate"),
                        trailing: IconButton(
                          onPressed: () {
                            FireStoreHelper.showOrNot(baby.babyId,
                                "showHeartpulse", !baby.showHeartpulse!);
                          },
                          icon: Icon(FontAwesomeIcons.heartbeat),
                          color: baby.showHeartpulse! ? mainColor : null,
                        ),
                        subtitle: Text(baby.heartPulse ?? "Nodata"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Oxygen"),
                        trailing: IconButton(
                            onPressed: () {
                              null;
                              // FireStoreHelper.showOrNot(
                              //     baby.babyId, "showTemp", !baby.showTemp!);
                            },
                            icon: Icon(
                              Icons.ad_units_rounded,
                              color: mainColor,
                            )),
                        subtitle: Text(baby.oxygen ?? "Nodata"),
                      ),
                      Divider(),
                      Center(
                        child: ListTile(
                          title: Text("Baby Location"),
                          trailing: IconButton(
                              onPressed: null,
                              icon: FaIcon(FontAwesomeIcons.locationArrow)),
                          subtitle: Text("Press here to show location"),
                          onTap: () async {
                            final lat = baby.lattude ?? "31";
                            final lon = baby.longtude ?? '31';
                            final url =
                                'https://www.google.com/maps/search/?api=1&query=${lat},${lon}';
                            if (await canLaunch(url)) {
                              print('done');
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Baby Live Camera"),
                        trailing: IconButton(
                          onPressed: () {
                            FireStoreHelper.showOrNot(
                                baby.babyId, "showCamera", !baby.showCamera!);
                          },
                          icon: FaIcon(FontAwesomeIcons.camera),
                          color: s ? mainColor : null,
                        ),
                        subtitle: Text("Press here to show camera"),
                        onTap: () {
                          print("S");
                        },
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
