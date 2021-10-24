import 'package:flutter/material.dart';
import 'package:studentzone/screens/splashscreen.dart';
import 'screens/splashscreen.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/profile.dart';
import 'screens/base.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Zone',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      home: splashscreen(),
      routes: {
        splashscreen.routeName: (context) => splashscreen(),
        login.routeName: (context) => login(),
        register.routeName: (context) => register(),
        profile.routeName: (context) => profile(),
        base.routeName: (context) => base(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Colors.red,
//         ),
        
     

//         );
//   }
// }
