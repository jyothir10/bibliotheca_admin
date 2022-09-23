import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheca_admin/Components/Background.dart';
import '../Components/BottomBar.dart';
import '../Components/FineDetailsCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bibliotheca_admin/constants.dart';


class FineDetails extends StatefulWidget {
  static const String id = '/fine';
  const FineDetails({Key? key}) : super(key: key);

  @override
  State<FineDetails> createState() => _FineDetailsState();
}

class _FineDetailsState extends State<FineDetails> {
  String admno = "";
  bool exist = false;
  TextEditingController searchcontroller = TextEditingController();
  var dt =  DateTime.now();

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
          Background(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
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
                      'Search Student',
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
                  admno.length == 6
                      ? Container(
                    height:500,
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
                                String name = data['name'];
                                List l1 = data['bookid'];
                                List l2 = data['bookname'];
                                List l3 = data['issuedates'];
                                List l4 = data['returndates'];

                                return Container(
                                  height: 500,
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

                                          if(dt.isAfter(date_return)){
                                            var day = dt.difference(date_return);
                                            return FineDetailsCard(
                                              name: name,
                                              bookname: l2[index],
                                              isbn: l1[index],
                                              issuedate: issuedate,
                                              returndate: returndate,
                                              days: day.inDays.toString(),
                                              fine: day.inDays* 5,   //per day fine is 5
                                            );
                                          }
                                          else
                                            return Container();
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
        ]),
        bottomNavigationBar: const BottomBar(
          index: 1,
        ),
      ),
    );
  }
}

// BookReturnCard(
// name: l2[index],
// dateTime:
// DateTime.now(),
// number: l1[index],
// issuedate: issuedate,
// duedate: returndate,
// );