import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/BottomBar.dart';
import 'package:bibliotheca_admin/Components/GreenButton.dart';
import 'package:bibliotheca_admin/Components/LoginScreenTextfiled.dart';
import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);
  static const String id = '/addbook';

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController authorcontroller = TextEditingController();
  TextEditingController isbncontroller = TextEditingController();
  TextEditingController genrecontroller = TextEditingController();
  TextEditingController shelfcontroller = TextEditingController();
  TextEditingController rackcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showSpinner = false;

    Future addBook() async {
      setState(() {
        showSpinner = true;
      });
      final books = FirebaseFirestore.instance
          .collection('Books')
          .doc(isbncontroller.text);

      final book = Book(
        id: isbncontroller.text.trim(),
        name: namecontroller.text.trim(),
        author: authorcontroller.text.trim(),
        branch: genrecontroller.text.trim(),
        isavail: true,
        shelf: int.parse(shelfcontroller.text.trim()),
        rack: int.parse(rackcontroller.text.trim()),
      );

      final json = book.toJson();
      await books.set(json);
      isbncontroller.clear();
      namecontroller.clear();
      authorcontroller.clear();
      genrecontroller.clear();
      shelfcontroller.clear();
      rackcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();

      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text("Successfully added book")));
      setState(() {
        showSpinner = false;
      });
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, DashBoardScreen.id);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: const BottomBar(
          index: 0,
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
            children: [
              Background(),
              SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? Row(
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
                          )
                        : Container(),
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
                      padding: MediaQuery.of(context).viewInsets.bottom == 0
                          ? EdgeInsets.only(top: 9, bottom: 15)
                          : EdgeInsets.only(bottom: 5),
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
                    GreenButton(
                        text: "Add Book",
                        width: MediaQuery.of(context).size.width * .408,
                        onTap: () {
                          //todo: add new book
                          addBook();
                        })
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Book {
  final String? id, name, author, branch;
  final int? shelf, rack;
  bool? isavail;

  Book(
      {this.id,
      this.name,
      this.author,
      this.branch,
      this.isavail,
      this.shelf,
      this.rack});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'branch': branch,
        'isavail': isavail,
        'shelf': shelf,
        'rack': rack
      };
}
