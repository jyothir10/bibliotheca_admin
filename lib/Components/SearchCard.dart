import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.name,
    required this.author,
    required this.branch,
    required this.isbn,
    required this.shelf,
    required this.rack,
    required this.status,
  }) : super(key: key);

  final String name;
  final String isbn;
  final String author;
  final String branch;
  final bool status;
  final int shelf;
  final int rack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 209,
      width: MediaQuery.of(context).size.width * .86470,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:
                        status == true ? Color(0xff9dff22) : Colors.redAccent,
                    maximumSize: Size(155, 33),
                    minimumSize: Size(150, 33),
                    elevation: 5),
                onPressed: () {},
                child: Row(
                  children: [
                    const Text(
                      'Status :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    status == true
                        ? const Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const Text(
                            'Not available',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Author: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Book No: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        isbn,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Row(
                      children: [
                        Text(
                          'Branch: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          branch,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Shelf no: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        shelf.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      children: [
                        Text(
                          'Rack no: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          rack.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
