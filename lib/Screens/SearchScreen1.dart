import 'package:bibliotheca_admin/Components/Background.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:flutter/material.dart';

import '../Components/SearchCard.dart';

class SearchScreen1 extends StatefulWidget {
  static const String id = '/search1';
  const SearchScreen1({Key? key}) : super(key: key);

  @override
  State<SearchScreen1> createState() => _SearchScreen1State();
}

class _SearchScreen1State extends State<SearchScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColour, width: 1.0),
                        ),
                        prefixIconColor: primaryColour,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        hintText: 'Search Book Name'
                            '',
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: SingleChildScrollView(
                          child: SearchCard(
                            name: 'Computer Fundamentals and Programming in C',
                            author: "Reema Thareja",
                            branch: "cse",
                            isbn: "AC963127",
                            shelf: 9,
                            rack: 3,
                            status: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
