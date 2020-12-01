import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Tampilan/login.dart';
import 'Tampilan/SignUp.dart';
import 'Tampilan/Home.dart';
import 'authent.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const routeId = 'CatalogHome';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Auth())
      ],
      child: MaterialApp(
        theme: ThemeData.light(
          // primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Login.routeId,
        routes: {
          Login.routeId : (context)=>Login(),
          SignUp.routeId : (context)=>SignUp(),
          Home.routeId : (context)=>Home(),
        },
      ),
    );
  }
}