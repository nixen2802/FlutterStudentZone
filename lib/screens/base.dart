import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentzone/screens/addproduct.dart';
import 'package:studentzone/screens/home.dart';
import 'package:studentzone/screens/myproducts.dart';
import 'package:studentzone/screens/notifications.dart';

import 'profile.dart';
import 'screen3.dart';

class base extends StatefulWidget {
  static const routeName = '/base';

  @override
  _baseState createState() => _baseState();
}

class _baseState extends State<base> {
  late int _currentIndex;
  late List<Widget> _children;

  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      home(),
      myproducts(),
      notifications(),
      addproduct(),
      profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   title: Text("Screen 1"),
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   title: Text("Screen 2"),
          // ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.home), title: Text("Screen 3")),

          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black,fontSize: 12),
            ),
          ),

          /// My Products
          SalomonBottomBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            title: Text("My Products", style: TextStyle(color: Colors.black,fontSize: 12)),
          ),

          /// Notifications
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            title: Text("Notifications", style: TextStyle(color: Colors.black,fontSize: 12)),
          ),

          /// Add Products
          SalomonBottomBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            title: Text("Add Product", style: TextStyle(color: Colors.black,fontSize: 12)),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black),
            title: Text("Profile", style: TextStyle(color: Colors.black,fontSize: 12)),
          ),
        ],
      ),

      // tabBuilder: (BuildContext context, int index) {
      //   return CupertinoTabView(
      //     builder: (BuildContext context) {
      //       return SafeArea(
      //         top: false,
      //         bottom: false,
      //         child: CupertinoApp(
      //           home: Scaffold(
      //             resizeToAvoidBottomInset: false,
      //             child: _children[_currentIndex],
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // }
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

    // int _selectedIndex = 4;
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: AppBar(
    //     backgroundColor: Colors.red,
    //   ),
      

    //    bottomNavigationBar: SalomonBottomBar(
    //     currentIndex: _selectedIndex,
    //     onTap: (i) => setState(() => _selectedIndex = i),
    //     items: [
    //       /// Home
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.home, color: Colors.black),
    //         title: Text(
    //           "Home",
    //           style: TextStyle(color: Colors.black),
    //         ),
    //       ),

    //       /// My Products
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.person, color: Colors.black),
    //         title: Text("My Products", style: TextStyle(color: Colors.black)),
    //       ),

    //       /// Notifications
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.notifications, color: Colors.black),
    //         title: Text("Notifications", style: TextStyle(color: Colors.black)),
    //       ),

    //       /// Add Products
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.add, color: Colors.black),
    //         title: Text("Add Product", style: TextStyle(color: Colors.black)),
    //       ),

    //       ///Profile
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.account_circle ,color: Colors.black),
    //         title: Text("Profile", style: TextStyle(color: Colors.black)),
    //       ),
    //     ],
    //   ),
    // );
 

