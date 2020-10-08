import 'package:easyfest/screens/home_screen.dart';
import 'package:easyfest/screens/login_screen.dart';
import 'package:easyfest/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

void main() {


  runApp(MyApp());


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'Easy Fest',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );,
    )
  }
}
