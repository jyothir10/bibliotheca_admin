import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/BottomBar.dart';
import 'package:bibliotheca_admin/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);
  static const String id = '/addbook';

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController authorcontroller = TextEditingController();
  TextEditingController isbncontroller = TextEditingController();
  TextEditingController genrecontroller = TextEditingController();
  TextEditingController shelfcontroller = TextEditingController();
  TextEditingController rackcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, DashBoardScreen.id);
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: const BottomBar(
          index: 0,
        ),
        body: Stack(
          children: [
            Background(),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: primaryColour,
                        ),
                      ),
                    ],
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: const Text(
                            'Register New Book',
                            style: TextStyle(
                              color: Color(0xff2f8a8a),
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              shadows: [
                                BoxShadow(
                                  color: Color(0x7fffffff),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 15),
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .91062,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x7f000000),
                              blurRadius: 3,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 21),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LoginScreenTextField(
                                  text: "Book Number",
                                  onchanged: (value) {},
                                  type: TextInputType.text,
                                  obscure: false,
                                  mycontroller: isbncontroller),
                              LoginScreenTextField(
                                  text: "Name",
                                  onchanged: (value) {},
                                  type: TextInputType.text,
                                  obscure: false,
                                  mycontroller: namecontroller),
                              LoginScreenTextField(
                                  text: "Author",
                                  onchanged: (value) {},
                                  type: TextInputType.name,
                                  obscure: false,
                                  mycontroller: authorcontroller),
                              LoginScreenTextField(
                                  text: "Branch",
                                  onchanged: (value) {},
                                  type: TextInputType.text,
                                  obscure: false,
                                  mycontroller: genrecontroller),
                              LoginScreenTextField(
                                  text: "Shelf No:",
                                  onchanged: (value) {},
                                  type: TextInputType.number,
                                  obscure: false,
                                  mycontroller: shelfcontroller),
                              LoginScreenTextField(
                                  text: "Rack no:",
                                  onchanged: (value) {},
                                  type: TextInputType.number,
                                  obscure: false,
                                  mycontroller: rackcontroller),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
