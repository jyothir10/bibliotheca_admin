import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 896,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
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
              top: 262,
              left: 286,
              child: Container(
                  width: 205,
                  height: 211,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25999999046325684),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color(0xff00B9B9).withOpacity(0.90),
                    borderRadius: BorderRadius.all(Radius.elliptical(205, 211)),
                  ))),
          Positioned(
            top: -12,
            left: 49,
            child: Container(
                width: 365,
                height: 204,
                child: SvgPicture.asset("images/Group 117.svg")),
          ),
          MediaQuery.of(context).viewInsets.bottom == 0
              ? Positioned(
                  bottom: 50,
                  right: -10,
                  child: Opacity(
                    opacity: 0.95,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xff00B9B9),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
