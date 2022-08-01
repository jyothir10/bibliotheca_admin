import 'dart:math' as math;

import 'package:bibliotheca_admin/Components/BottomBar.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  static const String id = '/contact_us';
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomBar(
        index: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 10),
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                        color: primaryColour,
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: math.pi / 2 + math.pi / 9,
                      child: Blob.fromID(
                        styles: BlobStyles(
                          color: const Color(0xffB0EDE2).withOpacity(0.50),
                        ),
                        id: const ['13-6-9822'],
                        size: 380,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("images/male-call-center-operator.gif"),
                      radius: 100,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const card(
                      title: 'Phone Number',
                      subtitle: '+91-123456789',
                      ic: Icons.phone,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const card(
                          title: 'E-mail ID',
                          subtitle: 'abc@gcek.ac.in',
                          ic: Icons.email_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? ic;

  const card({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.ic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 56.0,
        width: 56.0,
        margin: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F3F3),
          shape: BoxShape.circle,
        ),
        child: Icon(ic, size: 36.0),
      ),
      title: Text(
        '$title',
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
      subtitle: Text(
        '$subtitle',
        style: const TextStyle(fontFamily: 'Montserrat'),
      ),
    );
  }
}
