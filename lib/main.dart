import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'signin.dart';
=======
import 'package:studentzone/screens/splashscreen.dart';
import 'screens/splashscreen.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/profile.dart';
import 'screens/base.dart';
import 'package:provider/provider.dart';
>>>>>>> 50f7d40b65bda2a456a2df03f44d1bb7420499fb

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

<<<<<<< HEAD
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      // body: ListView( 
      //   shrinkWrap: true,
      // children: [
      //   new Container(
      //   padding: new EdgeInsets.all(32.0),
      //   child: new Center(
      //     child: new Column(
      //       children: [
      //         Align(
      //           alignment: Alignment.centerLeft,
      //           child: Container(
      //             color: Colors.white,
      //             child: Text(
      //               'REGISTER',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
      //            ),
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(20.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Name',
      //             enabledBorder: const OutlineInputBorder(
      //                       borderSide: const BorderSide(color: Colors.black, width: 2.0),
      //                     ),
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Email address',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Phone Number',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Confirm password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('REGISTER'), 
      //           color: Colors.red,
      //           textColor: Colors.black,
      //           shape: const RoundedRectangleBorder(
      //             side: const BorderSide(color: Colors.black, width: 2),
      //             ),
      //             padding: EdgeInsets.fromLTRB(125, 20, 130, 20),),
      //       ],
      //     )
      //   )
      // )]
      // )

      // body: new Container(
      //   padding: new EdgeInsets.all(32.0),
      //     child: new Column(
      //       children: [
      //         Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
      //         Align(
      //           alignment: Alignment.centerLeft,
      //           child: Container(
      //             color: Colors.white,
      //             child: Text(
      //               'LOGIN',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
      //            ),
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Email address',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: const InputDecoration(
      //             hintText: 'Password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('LOG IN'), 
      //           color: Colors.red,
      //           textColor: Colors.black,
      //           shape: const RoundedRectangleBorder(
      //             side: const BorderSide(color: Colors.black, width: 2),
      //             ),
      //             padding: EdgeInsets.fromLTRB(132, 20, 130, 20),),
      //       ],
      //     )
      // )


      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Padding(padding: EdgeInsets.all(160.0)),
      //       Center(
      //         child:
      //         Text(
      //         "StudentZone",
      //         style: TextStyle(
      //           color: Colors.red,
      //           fontSize: 30
      //         )
      //       ),
      //       ),
      //       Padding(padding: EdgeInsets.all(140.0)),
      //       Center(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //         //     new ElevatedButton(onPressed: null, child: Text('LOGIN'), 
      //         //     style: ButtonStyle(
      //         //     backgroundColor: MaterialStateProperty.all(Colors.white),
      //         //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
      //         //   ),
      //         // ),
      //         new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('LOG IN'), 
      //           color: Colors.white,
      //           textColor: Colors.black,
      //           shape: RoundedRectangleBorder(
      //             side: BorderSide(color: Colors.black, width: 2)
      //             ),
      //           padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
      //           ),
      //           Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
      //           new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('REGISTER'), 
      //           color: Colors.red,
      //           textColor: Colors.white,
      //           shape: RoundedRectangleBorder(
      //             side: BorderSide(color: Colors.red, width: 2)
      //             ),
      //           padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
      //           ),
      //         // new ElevatedButton(onPressed: null, child: Text('REGISTER'), style: ButtonStyle(
      //         // backgroundColor: MaterialStateProperty.all(Colors.red),
      //         // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
      //         // ))
      //         ],
      //       ),
      //       ),
      //     ],
      //   ),
      // ),


      body: Signin()
      // Center(
      //   child: Column(
      //     children: [
      //       Padding(padding: EdgeInsets.fromLTRB(100, 50, 100, 0)),
      //       CircleAvatar(
      //       radius: 70,
      //       backgroundImage: NetworkImage('https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg')
      //       ),
      //       Text(
      //               'Nayan Mandliya',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
      //       ),
      //       Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
      //       Text(
      //               'nayan@gmail.com',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
      //       ),
      //       Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
      //       new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('EDIT PROFILE'), 
      //           color: Colors.red,
      //           textColor: Colors.white,
      //           shape: RoundedRectangleBorder(
      //             side: BorderSide(color: Colors.red, width: 2)
      //             ),
      //           padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
      //           ),
      //           Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
      //           new RaisedButton(
      //           onPressed: (){print("Null");}, 
      //           child: Text('ADDS'), 
      //           color: Colors.white,
      //           textColor: Colors.black,
      //           shape: RoundedRectangleBorder(
      //             side: BorderSide(color: Colors.black, width: 2)
      //             ),
      //           padding: EdgeInsets.fromLTRB(125, 20, 120, 20),
      //           ),
      //           Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
      //           Container(
      //           height: 150.0,
      //           width: 400.0,
      //           color: Colors.transparent,
      //           child: Container(
      //             decoration: BoxDecoration(
      //                 color: Colors.grey,
      //                 borderRadius: BorderRadius.all(Radius.circular(5.0))),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
=======
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
>>>>>>> 50f7d40b65bda2a456a2df03f44d1bb7420499fb
