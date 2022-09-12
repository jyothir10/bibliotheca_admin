import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/GreenButton.dart';
import 'package:bibliotheca_admin/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookIssueScreen extends StatefulWidget {
  static const String id = '/bookissue';

  const BookIssueScreen({Key? key}) : super(key: key);

  @override
  State<BookIssueScreen> createState() => _BookIssueScreenState();
}

class _BookIssueScreenState extends State<BookIssueScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime _dateTime = DateTime.now();
  DateTime _date_return = DateTime.now().add(const Duration(days: 15));
  TextEditingController namecontroller = TextEditingController();
  TextEditingController admissioncontroller = TextEditingController();
  TextEditingController isbncontroller = TextEditingController();
  bool exist = false;
  bool isavail = true;

  Future issueBook() async {
    final student = FirebaseFirestore.instance
        .collection('Students')
        .doc(admissioncontroller.text);

    await FirebaseFirestore.instance
        .collection('Books')
        .doc(isbncontroller.text)
        .get()
        .then((value) {
      exist = value.exists;
    });

    if (exist == true) {
      await FirebaseFirestore.instance.collection('Books').get().then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['id'] == isbncontroller.text) {
            isavail = value.docs[i]['isavail'];
          }
        }
      });

      if (isavail) {
        final book = FirebaseFirestore.instance
            .collection('Books')
            .doc(isbncontroller.text);
        book.update({'isavail': false});
        student.update({
          'bookid': FieldValue.arrayUnion([isbncontroller.text])
        });
        student.update({
          'bookname': FieldValue.arrayUnion([namecontroller.text])
        });
        student.update({
          'issuedates': FieldValue.arrayUnion([_dateTime])
        });
        student.update({
          'returndates': FieldValue.arrayUnion([_date_return])
        });
        FocusManager.instance.primaryFocus?.unfocus();
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            content: Text("Successfully issued book")));
      } else {
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            content: Text("Book is not available !")));
      }
    } else {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text("Book does not exist !")));
    }
    namecontroller.clear();
    isbncontroller.clear();
    admissioncontroller.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: primaryColour,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? const Text(
                          'Book Issue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
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
                        )
                      : Container(),
                  Container(
                    width: MediaQuery.of(context).size.width * .91062,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x7f000000),
                          blurRadius: 3,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LoginScreenTextField(
                              text: "Book No",
                              onchanged: (value) {},
                              type: TextInputType.name,
                              obscure: false,
                              mycontroller: isbncontroller),
                          LoginScreenTextField(
                              text: "Book Name",
                              onchanged: (value) {},
                              type: TextInputType.name,
                              obscure: false,
                              mycontroller: namecontroller),
                          LoginScreenTextField(
                              text: "Student Admission No",
                              onchanged: (value) {},
                              type: TextInputType.name,
                              obscure: false,
                              mycontroller: admissioncontroller),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Date : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2019),
                                            lastDate: DateTime.now())
                                        .then((date) {
                                      setState(() {
                                        _dateTime = date!;
                                      });
                                    });
                                  },
                                  child: Card(
                                    elevation: 5,
                                    color: Color(0xffc8cdd3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        children: [
                                          Text(
                                            _dateTime
                                                .toString()
                                                .substring(0, 10),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_month,
                                            color: primaryColour,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GreenButton(
                              text: "Submit",
                              width: MediaQuery.of(context).size.width * .408,
                              onTap: () {
                                if (isbncontroller.text.isNotEmpty &&
                                    namecontroller.text.isNotEmpty &&
                                    admissioncontroller.text.isNotEmpty) {
                                  issueBook();
                                } else {
                                  _scaffoldKey.currentState?.showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                          "Invalid entry! Please fill all the details "),
                                    ),
                                  );
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
