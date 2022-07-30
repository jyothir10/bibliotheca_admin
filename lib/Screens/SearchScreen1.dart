import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/Components/SearchCard.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen1 extends StatefulWidget {
  static const String id = '/search1';
  const SearchScreen1({Key? key}) : super(key: key);

  @override
  State<SearchScreen1> createState() => _SearchScreen1State();
}

class _SearchScreen1State extends State<SearchScreen1> {
  TextEditingController searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late QuerySnapshot snapshotData;
  bool isExecuted = false;
  String searchVal = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, SearchScreen.id);
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            Background(),
            Positioned(
              left: 12,
              top: 48,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: primaryColour,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 21,
              right: 21,
              child: SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: TextField(
                          onChanged: (val) {
                            setState(() {
                              searchVal = val;
                            });
                          },
                          controller: searchcontroller,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColour, width: 1.0),
                            ),
                            prefixIconColor: primaryColour,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {},
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Search Book Name'
                                '',
                          ),
                        ),
                      ),
                      searchVal == ""
                          ? Container(
                              height: 632,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Books')
                                    .snapshots(),
                                builder: (context, snapshots) {
                                  return (snapshots.connectionState ==
                                          ConnectionState.waiting)
                                      ? Container()
                                      : ListView.builder(
                                          itemCount:
                                              snapshots.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            var data = snapshots
                                                .data!.docs[index]
                                                .data() as Map<String, dynamic>;
                                            return SearchCard(
                                              name: data['name'],
                                              author: data['author'],
                                              branch: data['branch'],
                                              isbn: data['id'],
                                              shelf: data['shelf'],
                                              rack: data['rack'],
                                              status: data['isavail'],
                                            );
                                          });
                                },
                              ),
                            )
                          : Container(
                              height:
                                  MediaQuery.of(context).viewInsets.bottom == 0
                                      ? 632
                                      : 632 -
                                          MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                              color: Colors.transparent,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Books')
                                    .snapshots(),
                                builder: (context, snapshots) {
                                  return (snapshots.connectionState ==
                                          ConnectionState.waiting)
                                      ? Container()
                                      : ListView.builder(
                                          itemCount:
                                              snapshots.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            var data = snapshots
                                                .data!.docs[index]
                                                .data() as Map<String, dynamic>;
                                            if (data['name']
                                                .toString()
                                                .toLowerCase()
                                                .contains(
                                                    searchVal.toLowerCase())) {
                                              return SearchCard(
                                                name: data['name'],
                                                author: data['author'],
                                                branch: data['branch'],
                                                isbn: data['id'],
                                                shelf: data['shelf'],
                                                rack: data['rack'],
                                                status: data['isavail'],
                                              );
                                            }
                                            return Container();
                                          });
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
