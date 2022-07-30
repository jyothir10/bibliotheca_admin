import 'package:bibliotheca_admin/Screens/AddBookScreen.dart';
import 'package:bibliotheca_admin/Screens/ContactUsScreen.dart';
import 'package:bibliotheca_admin/Screens/DashBoardScreen.dart';
import 'package:bibliotheca_admin/Screens/LoginScreen.dart';
import 'package:bibliotheca_admin/Screens/SearchScreen.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: SearchScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        DashBoardScreen.id: (context) => DashBoardScreen(),
        AddBookScreen.id: (context) => AddBookScreen(),
        ContactUs.id: (context) => ContactUs(),
        SearchScreen.id: (context) => SearchScreen(),
      },
    );
  }
}
