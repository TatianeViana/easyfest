import 'package:easyfest/screens/home_screen.dart';
import 'package:easyfest/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {


  runApp(MyApp());


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Fest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
           ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
      );
  }
}
