import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/GreenButton.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookReturnScreen extends StatefulWidget {
  static const String id = '/book_return';

  const BookReturnScreen({Key? key}) : super(key: key);

  @override
  State<BookReturnScreen> createState() => _BookReturnScreenState();
}

class _BookReturnScreenState extends State<BookReturnScreen> {
  DateTime _dateTime = DateTime.now();
  TextEditingController searchcontroller = TextEditingController();
  String admno = "";
  bool exist = false;
  bool show = false;
  late QueryDocumentSnapshot<Map<String, dynamic>> books;
  List<String> bookids = [];
  List<String> booknames = [];
  List issuedates = [];
  List returndates = [];

  getBooks() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  children: [
                    Row(
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
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Book Return',
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            admno = val;
                            if (admno.length == 6) {
                              show = true;
                            }
                          });
                        },
                        controller: searchcontroller,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColour, width: 1.0),
                          ),
                          prefixIconColor: primaryColour,
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Admission Number'
                              '',
                        ),
                      ),
                    ),
                    show == true
                        ? Container(
                            height: 565,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Students')
                                  .snapshots(),
                              builder: (context, snapshots) {
                                return (snapshots.connectionState ==
                                        ConnectionState.waiting)
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: primaryColour,
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: snapshots.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          var data = snapshots.data!.docs[index]
                                              .data() as Map<String, dynamic>;
                                          if (data['admno'] == admno) {
                                            List l1 = data['bookid'];
                                            List l2 = data['bookname'];
                                            List l3 = data['issuedates'];
                                            List l4 = data['issuedates'];

                                            return Container(
                                              height: 565,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: ListView.builder(
                                                    itemCount: l1.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      DateTime date_issue =
                                                          l3[index].toDate();
                                                      String issuedate =
                                                          "${date_issue.day}-${date_issue.month}-${date_issue.year}";
                                                      DateTime date_return =
                                                          l4[index].toDate();
                                                      String returndate =
                                                          "${date_return.day}-${date_return.month}-${date_return.year}";

                                                      return BookReturnCard(
                                                          name: l2[index],
                                                          dateTime:
                                                              DateTime.now(),
                                                          number: l1[index],
                                                          issuedate: issuedate,
                                                          duedate: returndate);
                                                    }),
                                              ),
                                            );
                                          } else if (index ==
                                                  snapshots.data!.docs.length -
                                                      1 &&
                                              exist == false) {
                                            return Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "No isssued books!",
                                                    style: dashboardTextStyle
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        });
                              },
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BookReturnCard extends StatefulWidget {
  final String name;
  final String number;
  final String issuedate;
  final String duedate;
  DateTime dateTime;
  BookReturnCard(
      {Key? key,
      required this.name,
      required this.dateTime,
      required this.number,
      required this.issuedate,
      required this.duedate})
      : super(key: key);

  @override
  State<BookReturnCard> createState() => _BookReturnCardState();
}

class _BookReturnCardState extends State<BookReturnCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
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
        width: MediaQuery.of(context).size.width * .8,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ISBN Number : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Issue Date : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.issuedate,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Due Date : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.duedate,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Return Date : ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
                          widget.dateTime = date!;
                        });
                      });
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color(0xffc8cdd3),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Text(
                              widget.dateTime.toString().substring(0, 10),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
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
              GreenButton(
                  text: "Return Book",
                  width: MediaQuery.of(context).size.width * .4,
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
