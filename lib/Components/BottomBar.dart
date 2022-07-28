import 'package:bibliotheca_admin/Screens/ContactUsScreen.dart';
import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  final int index;
  const BottomBar({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final pages = [
    DashBoardScreen.id,
    DashBoardScreen.id,
    ContactUs.id,
    DashBoardScreen.id,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushReplacementNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: BottomNavigationBar(
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.index,
        selectedLabelStyle: const TextStyle(
          color: Color(0xff00B9B9), //todo:Label colour is not changing
          fontSize: 9.45121955871582,
          fontFamily: 'SFUIText',
        ),
        unselectedLabelStyle: TextStyle(
          color: Color(0xff000000).withOpacity(.2),
          fontSize: 9.45121955871582,
          fontFamily: 'SFUIText',
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/bottomnavigationbar/home.svg',
                height: 23,
              ),
              label: ' Home',
              activeIcon: SvgPicture.asset(
                'images/bottomnavigationbar/home1.svg',
                height: 23,
              )),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/fine.svg',
              height: 23,
            ),
            label: ' Fine',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/fine.svg',
              height: 23,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/help.svg',
              height: 23,
            ),
            label: 'Help',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/help1.svg',
              height: 23,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'images/bottomnavigationbar/profile.svg',
              height: 23,
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              'images/bottomnavigationbar/profile1.svg',
              height: 23,
            ),
          ),
        ],
        elevation: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
