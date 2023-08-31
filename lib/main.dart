import 'package:c_proto/Constants/Datas/aData.dart';
import 'package:c_proto/Constants/Design/color_schemes.g.dart';
import 'package:c_proto/Screens/Pages/auth/LoginPage.dart';
import 'package:c_proto/Screens/Pages/main/ReportPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: 'SpokaHan'),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, fontFamily: 'SpokaHan'),
      home: LoginPage(),
    );
  }
}
