import 'package:bibliotheca_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashBoardCard extends StatelessWidget {
  String img;
  String text;
  void Function()? onTap;
  DashBoardCard({
    required this.text,
    required this.img,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 145,
        width: MediaQuery.of(context).size.width * .4383,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0x4c000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              img,
              height: 74,
              width: MediaQuery.of(context).size.width * .2923,
              fit: BoxFit.contain,
            ),
            Text(
              text,
              style: dashboardTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
