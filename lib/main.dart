import 'package:aayu_doctor/authscreens/login.dart';
import 'package:aayu_doctor/authscreens/welcome.dart';
import 'package:aayu_doctor/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "Welcome": (context) => SafeArea(child: Welcome()),
        "Login": (context) => SafeArea(child: Login()),
        "Main": (context) => HomeScreen()
      },
      home: Welcome(),
    );
  }
}
