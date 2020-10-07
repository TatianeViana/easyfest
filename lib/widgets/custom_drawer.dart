import 'package:easyfest/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {
  final PageController  pageController;
  CustomDrawer(this.pageController);


  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: Colors.transparent,
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0 , top:16.0),
            children: <Widget> [
              Container(
                margin: EdgeInsets.only(bottom:8.0 ),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top:32.0,
                      left: 0.0,
                      child: Text("Easy Fest",
                      style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          GestureDetector(
                            child: Text(
                              "Entre ou  cadastre-se>",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio",pageController,0),
              DrawerTile(Icons.add_location, "Meus endereços",pageController,1),
              DrawerTile(Icons.message, "Chats",pageController,2),
              DrawerTile(Icons.playlist_add_check, "Meus pedidos",pageController,3),
            ],

          )

        ],
      ),
    );
  }
}
