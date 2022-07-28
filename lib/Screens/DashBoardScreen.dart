import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/BottomBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Components/DashBoardCard.dart';

class DashBoardScreen extends StatefulWidget {
  static const String id = '/dashboard';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          content: Text("Press back again to exit")));
      return Future.value(false);
    }
    return Future.value(true);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(
        index: 0,
      ),
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    18, MediaQuery.of(context).size.height * .1, 18, 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 21),
                    children: [
                      DashBoardCard(
                        img: "images/dashboard/issue.svg",
                        text: 'Issue Book',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/return.svg",
                        text: 'Return Book',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/reg.svg",
                        text: 'Add New Book',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/searchs.svg",
                        text: 'Search Student',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/searchb.svg",
                        text: 'Search Book',
                        onTap: () {},
                      ),
                      DashBoardCard(
                        img: "images/dashboard/librarian.svg",
                        text: 'Add New Librarian',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
