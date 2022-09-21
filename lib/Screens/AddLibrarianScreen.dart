import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddLibrarianScreen extends StatefulWidget {
  static const String id = '/reg';

  AddLibrarianScreen({Key? key}) : super(key: key);

  @override
  AddLibrarianScreenState createState() => AddLibrarianScreenState();
}

class AddLibrarianScreenState extends State<AddLibrarianScreen> {
  bool isChecked1 = false;
  bool showSpinner = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future signUp() async {
    setState(() {
      showSpinner = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());

      final librarians = FirebaseFirestore.instance
          .collection('Teachers')
          .doc(idcontroller.text);

      final librarian = Librarian(
        id: idcontroller.text.trim(),
        name: namecontroller.text.trim(),
        email: emailcontroller.text.trim(),
      );

      final json = librarian.toJson();
      await librarians.set(json);
      idcontroller.clear();
      namecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      _scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text(
            "Successfully added new librarian",
          ),
        ),
      );
      setState(() {
        showSpinner = false;
      });
    } on FirebaseException catch (e) {
      print(e);
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text(
            e.message.toString(),
          ),
        ),
      );
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          color: primaryColour,
        ),
        child: Stack(
          children: <Widget>[
            Background(),
            SafeArea(
              child: Column(
                crossAxisAlignment:
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: primaryColour,
                          ))
                    ],
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? const Text(
                          'Register New Librarian',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 30,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )
                      : Container(),
                  Container(
                    child: Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(33),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: MediaQuery.of(context).viewInsets.bottom == 0?445:430,
                        width: 5 * MediaQuery.of(context).size.width / 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LoginScreenTextField(
                              mycontroller: namecontroller,
                              text: "Name",
                              type: TextInputType.name,
                              obscure: false,
                              onchanged: (value) {},
                            ),
                            LoginScreenTextField(
                              mycontroller: idcontroller,
                              text: "Staff ID",
                              type: TextInputType.streetAddress,
                              obscure: false,
                              onchanged: (value) {},
                            ),
                            LoginScreenTextField(
                              mycontroller: emailcontroller,
                              text: "Email",
                              type: TextInputType.emailAddress,
                              obscure: false,
                              onchanged: (value) {},
                            ),
                            LoginScreenTextField(
                              mycontroller: passwordcontroller,
                              text: "Password",
                              type: TextInputType.name,
                              obscure: true,
                              onchanged: (value) {},
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 18),
                                      color: primaryColour,
                                      child: SizedBox(
                                        width: 0.65 *
                                            MediaQuery.of(context).size.width,
                                        height: 0.7,
                                      ),
                                    ),
                                  ),
                                  CheckboxListTile(
                                    value: isChecked1,
                                    dense: true,
                                    activeColor: primaryColour,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked1 = value!;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text(
                                      'I acknowledge that i have read and agree to the above terms and conditions.',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MediaQuery.of(context).viewInsets.bottom == 0?Container(
                              margin: const EdgeInsets.only(
                                  left: 6, right: 6, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                      },
                                      child: InkWell(
                                        //highlightColor: Color(),
                                        onTap: () {
                                          if (emailcontroller
                                                  .text.isNotEmpty &&
                                              passwordcontroller
                                                  .text.isNotEmpty &&
                                              idcontroller.text.isNotEmpty &&
                                          namecontroller.text.isNotEmpty ) {
                                            signUp();

                                          } else {
                                            _scaffoldKey.currentState
                                                ?.showSnackBar(const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                        "Please enter valid gmail and password")));
                                          }
                                        },
                                        child: Container(
                                          width: 0.45 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          height: 51,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                            color: const Color(0xff1AC135),
                                          ),
                                          child: const Text(
                                            "REGISTER",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ):Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Librarian {
  final String? id, name, email;

  Librarian({
    this.email,
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
  };
}