import 'package:bibliotheca_admin/Screens/AddBookScreen.dart';
import 'package:bibliotheca_admin/Screens/BookIssueScreen.dart';
import 'package:bibliotheca_admin/Screens/BookReturnScreen.dart';
import 'package:bibliotheca_admin/Screens/ContactUsScreen.dart';
import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:bibliotheca_admin/Screens/LoginScreen.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen1.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen2.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen3.dart';
import 'package:bibliotheca_admin/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/SplashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColour,
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        DashBoardScreen.id: (context) => DashBoardScreen(),
        AddBookScreen.id: (context) => AddBookScreen(),
        ContactUs.id: (context) => ContactUs(),
        SearchScreen.id: (context) => SearchScreen(),
        SearchScreen1.id: (context) => SearchScreen1(),
        SearchScreen2.id: (context) => SearchScreen2(),
        SearchScreen3.id: (context) => SearchScreen3(),
        BookIssueScreen.id: (context) => BookIssueScreen(),
        BookReturnScreen.id: (context) => BookReturnScreen(),
      },
    );
  }
}
