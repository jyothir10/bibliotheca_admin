import 'package:bibliotheca_admin/constants.dart';
import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final double width;
  void Function()? onTap;
  WhiteButton({
    required this.text,
    required this.width,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .066,
        width: width,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: primaryColour,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
