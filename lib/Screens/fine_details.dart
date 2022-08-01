import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(
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
          top: 400,
          right: 30,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xff00B9B9),
              borderRadius: BorderRadius.all(Radius.circular((150)),
              ),
            ),
          ),
        ),
        Positioned(
          left: 55, top: 90,
          child: Text(
            'Fine Details',
            style: TextStyle(
              color: Color(0xFF0025A9),
              fontSize: 32,
              fontFamily: 'Montserrat',
            ),
          ),),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:EdgeInsets.only(top: 35,left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Color(0xFF545AD8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.08*MediaQuery.of(context).size.height,),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 150),
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
    );
  }
}

