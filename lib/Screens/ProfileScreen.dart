import 'dart:math' as math;

import 'package:bibliotheca_admin/Components/GreenButton.dart';
import 'package:bibliotheca_admin/Components/profile-field_widget.dart';
import 'package:bibliotheca_admin/Components/prop-value_text.dart';
import 'package:bibliotheca_admin/Components/prop-value_widget.dart';
import 'package:bibliotheca_admin/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Components/BottomBar.dart';
import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<textValue> value = <textValue>[
    const textValue(t: 'Shruti', c: black),
    const textValue(t: '19B123', c: black),
    const textValue(t: 'abc@xyz.com', c: black),
    const textValue(t: '+91-123456789', c: black)
  ];
  final List<textProperty> property = <textProperty>[
    const textProperty(t: 'Name :', c: black),
    const textProperty(t: 'Admission No.:', c: black),
    const textProperty(t: 'E-mail :', c: black),
    const textProperty(t: 'Phone :', c: black)
  ];

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: -80,
              left: -75,
              child: Transform.rotate(
                angle: 5.461800904670572 * (math.pi / 180),
                child: Container(
                    width: 465.34326171875,
                    height: 358.24896240234375,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B9B9).withOpacity(0.20),
                      borderRadius: const BorderRadius.all(Radius.elliptical(
                          465.34326171875, 358.24896240234375)),
                    )),
              )),
          Positioned(
              top: -146,
              left: -50,
              child: Container(
                  width: 498,
                  height: 358,
                  decoration: BoxDecoration(
                    color: const Color(0xff00B9B9).withOpacity(0.90),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(498, 358)),
                  ))),
          Positioned(
            left: 12,
            top: 48,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Color(0xFFffffff),
              ),
            ),
          ),
          const Positioned(
            left: 155,
            top: 58,
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          const Positioned(
            left: 100,
            top: 125,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/person.jpg"),
              radius: 90,
            ),
          ),
          Positioned(
            top: 270,
            left: 30,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: double.maxFinite,
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: property.length,
                        itemBuilder: (BuildContext context, int index) {
                          return profileField(
                              w: propValueWidget(
                            widget1: property[index],
                            widget2: value[index],
                          ));
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: GreenButton(
                        text: "Logout",
                        width: MediaQuery.of(context).size.width * .43,
                        onTap: () {
                          _signOut();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(
        index: 3,
      ),
    );
  }
}
