import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:flutter/material.dart';

class SearchStudentScreen extends StatefulWidget {
  static const String id = '/search_student';

  const SearchStudentScreen({Key? key}) : super(key: key);

  @override
  State<SearchStudentScreen> createState() => _SearchStudentScreenState();
}

class _SearchStudentScreenState extends State<SearchStudentScreen> {
  DateTime _dateTime = DateTime.now();
  TextEditingController searchcontroller = TextEditingController();
  String admno = "";

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
                        ? BookReturnCard(
                            name: "System Software",
                            number: '978-3-16-148410-0',
                            issuedate: '29-06-2022',
                            duedate: '15-07-2022',
                            dateTime: _dateTime)
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
        height: 250,
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
            ],
          ),
        ),
      ),
    );
  }
}
