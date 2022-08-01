import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/BottomBar.dart';
import '../Components/card.dart';

class FineDetails extends StatefulWidget {
  static const String id = '/fine';
  const FineDetails({Key? key}) : super(key: key);

  @override
  State<FineDetails> createState() => _FineDetailsState();
}

class _FineDetailsState extends State<FineDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, DashBoardScreen.id);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Positioned(
            top: -12,
            left: 49,
            child: Container(
                width: 365,
                height: 204,
                child: SvgPicture.asset("images/Group 117.svg")),
          ),
          Positioned(
            top: 155,
            left: -80,
            child: Container(
              width: 212,
              height: 204,
              decoration: BoxDecoration(
                color: Color.fromRGBO(84, 90, 216, 0.10000000149011612),
                borderRadius: BorderRadius.all(Radius.elliptical(212, 204)),
              ),
            ),
          ),
          Positioned(
            top: 500,
            right: -5,
            child: Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                color: Color(0xff00B9B9),
                borderRadius: BorderRadius.all(
                  Radius.circular((190)),
                ),
              ),
            ),
          ),
          Positioned(
            left: 55,
            top: 90,
            child: Text(
              'Fine Details',
              style: TextStyle(
                color: Color(0xFF0025A9),
                fontSize: 32,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.17 * MediaQuery.of(context).size.height,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 180),
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      card(),
                      card(),
                      card(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
        bottomNavigationBar: const BottomBar(
          index: 1,
        ),
      ),
    );
  }
}
