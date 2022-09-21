import 'package:bibliotheca_admin/Components/prop-value_widget.dart';
import 'package:bibliotheca_admin/Components/prop-value_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheca_admin/constants.dart';

class FineDetailsCard extends StatelessWidget {
  final String name;
  final String bookname;
  final String isbn;
  final String issuedate;
  final String returndate;
  final String days;
  final int fine;

  const FineDetailsCard({Key? key, required this.name, required this.isbn, required this.issuedate, required this.returndate, required this.days, required this.fine, required this.bookname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 350,
      width: 3 * MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.only(left: 22, right: 22, bottom: 20),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 14, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 22, top: 20),
                child: Text(
                  bookname,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      height: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: SizedBox(
                  width: 380,
                  height: 1,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12, top: 32, bottom: 33),
                child: Column(
                  children: [
                    Container(
                      margin:
                      const EdgeInsets.only(bottom: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: textProperty(
                          t: 'ISBN Number:',
                          c: black,
                        ),
                        widget2: textValue(
                          t: isbn,
                          c: black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: textProperty(t: 'Issue Date: ', c: black),
                        widget2: textValue(t: issuedate, c: black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: textProperty(t: 'Return Date: ', c: black),
                        widget2: textValue(t: returndate, c: Colors.red),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: textProperty(t: 'Days Exceeded:', c: black),
                        widget2: textValue(t: days, c: black),
                      ),
                    ),
                    Container(
                      margin:
                      const EdgeInsets.only(top: 12, left: 8, right: 12),
                      child: propValueWidget(
                        widget1: textProperty(t: 'Due Total:', c: color1),
                        widget2: textValue(t: 'Rs. $fine', c: color1),
                      ),
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

