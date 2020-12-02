import 'package:Monitoring/Tampilan/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:Monitoring/authent.dart';
import 'package:Monitoring/Model/Item.dart';
import 'package:collection/collection.dart';
import 'package:Monitoring/Database/database.dart';
import 'package:Monitoring/Tampilan/Monitoring.dart';
import 'package:Monitoring/Tampilan/usulanUKPBJ.dart';
import 'package:Monitoring/Tampilan/usulanUnit.dart';
import 'package:Monitoring/Tampilan/usulanWR.dart';
import 'package:Monitoring/Tampilan/usulanPPK.dart';
import 'package:Monitoring/konstan.dart';
import 'package:Monitoring/Model/User.dart';



class Home extends StatefulWidget {
static const routeId = 'Home';

  @override
  State<StatefulWidget> createState() => HomeState();

}

 class HomeState extends State<Home> {
  List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Monitoring')),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), title: Text('Usulan')),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Profile')),
  ];
 
List<Widget> _listPage = [
    Dashboard(
      key: PageStorageKey('dashboard'),
    ),
   // Monitoring(
   //   key: PageStorageKey('cart')),
    //UsulanUKPBJ(
    //  key: PageStorageKey('usulanUKPBJ')),

  ];
 List<String> listDrwer = ['Home', 'SignOt'];
 Widget appBarTitle = Text('Home');
int selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

    AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      leading: FlatButton(
        onPressed: () {
          Provider.of<Auth>(context, listen: false).signOut(context);
        },
        child: Icon(Icons.exit_to_app),
      ),
      title: appBarTitle,
      centerTitle: true,

        );
 Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Database>(
            create: (context) => Database(
                  uid: Provider.of<Auth>(context, listen: false).getUser.uid,
                )),
        Provider<User>(
          create: (context) => User(
              //Provider for user information
              ),
        ),
        StreamProvider<List<Item>>(
          create: (context) => Database(
            uid: Provider.of<Auth>(context, listen: false).getUser.uid,
          ).getItems(),
          updateShouldNotify: (_,__)=>true,
        ),
      ],
      child: Scaffold(
          //Appbar sementara
          appBar: selectedIndex!=0? AppBar(
            // leading: Builder(builder: (context) {
            //   return IconButton(
            //       icon: Icon(Icons.menu),
            //       onPressed: () {
            //         Scaffold.of(context).openDrawer();
            //       });
            // }),
            title: Text("DASHBOARD"),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
            elevation: 0,
          ):null,
          // drawer: NavDrawer(listDrawer: listDrawer),
          body: PageStorage(bucket: bucket, child: _listPage[selectedIndex]),

          //Masih coba2
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[200],
            backgroundColor: Colors.blue[900],
            items: _bottomNavBarItem,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          )
          ),
    );
  }
}

      

  
}
    