import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tkz/constants.dart';
import 'Screens/new Profile beta/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Resident Zombie',
      theme: ThemeData(
          primaryColor: trzPrimaryDarkColor,
          scaffoldBackgroundColor: trzBackgroundColor),
      home: ProfileScreen(),
    );
  }
}
