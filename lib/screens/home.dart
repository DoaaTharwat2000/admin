import 'package:bi_tracer/models/mother_model.dart';
import 'package:bi_tracer/screens/babies.dart';
import 'package:bi_tracer/screens/doctors.dart';
import 'package:bi_tracer/screens/mothers.dart';
import 'package:bi_tracer/screens/register_admin.dart';
import 'package:bi_tracer/shared/web_screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Mothers(),
    Doctors(),
    Babies(),
    RegisterAdmin()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      backgroundColor: kIsWeb ? Colors.white : null,
      body: WebDesign(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.deepPurple,
              hoverColor: Colors.deepPurple,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.deepPurple,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.female,
                  text: 'Mothers',
                ),
                GButton(
                  icon: FontAwesomeIcons.userMd,
                  text: 'Doctors',
                ),
                GButton(
                  icon: FontAwesomeIcons.baby,
                  text: 'Babies',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Add Admin',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
