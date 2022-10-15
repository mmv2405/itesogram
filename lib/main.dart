import 'package:flutter/material.dart';
import 'package:itesogram/screens/login.dart';
import 'package:itesogram/screens/profile.dart';
import 'package:itesogram/utils/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Itesogram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: Login(),
    );
  }
}
