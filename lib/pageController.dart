import 'package:connected_car/carro/carListPage.dart';
import 'package:connected_car/garagem/garageListPage.dart';
import 'package:connected_car/usuario/userHomePage.dart';
import 'package:flutter/material.dart';




class ControladorPagina extends StatefulWidget {
  @override
  _ControladorPaginaState createState() => _ControladorPaginaState();
}

class _ControladorPaginaState extends State<ControladorPagina> {


  static List<Widget> widgetOptions = <Widget>[
    UserPage(),
    CarListPage(),
    HomePage(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final pageController = PageController();
  void onPageChanged(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text("User", style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car, color: Colors.white),
              title: Text(
                "List car",
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              title: Text("Garagens", style: TextStyle(color: Colors.white))),
        ],
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
        currentIndex: currentIndex,
        onTap: pageController.jumpToPage,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: widgetOptions,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
