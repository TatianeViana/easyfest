import 'package:easyfest/tabs/home_tab.dart';
import 'package:easyfest/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer:CustomDrawer(_pageController),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.blue,),
        Container(color: Colors.orange,),
        Container(color: Colors.yellow,),

      ],

    );
  }
}
