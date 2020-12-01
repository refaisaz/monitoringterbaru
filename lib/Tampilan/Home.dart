import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentification/login.dart';

class Home extends StatefulWidget {
static const routeId = 'Home';

  @override
  _HomeState createState() => _HomeState();

  }
  class _HomeState extends State<Home> {
List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('Dashboard')),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Monitoring')),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), title: Text('Market')),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Profile')),
  ];
 

   @override
  Widget build(BuildContext context) {
    child :Scaffold()


      ),
    );
      

  }
}