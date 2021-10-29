import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentzone/screens/register.dart';
import 'login.dart';
import 'register.dart';

class splashscreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _splashscreenState createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Container(
          CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg')),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(80.0)),
                Center(
                  child: Text("StudentZone",
                      style: TextStyle(color: Colors.red, fontSize: 30)),
                ),
                Padding(padding: EdgeInsets.all(40.0)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //     new ElevatedButton(onPressed: null, child: Text('LOGIN'),
                      //     style: ButtonStyle(
                      //     backgroundColor: MaterialStateProperty.all(Colors.white),
                      //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
                      //   ),
                      // ),
                      new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => login()),
                            (_) => false,
                          );
                        },
                        child: Text('LOG IN'),
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2)),
                        padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                      new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => register()),
                            (_) => false,
                          );
                        },
                        child: Text('REGISTER'),
                        color: Colors.red,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red, width: 2)),
                        padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
                      ),
                      // new ElevatedButton(onPressed: null, child: Text('REGISTER'), style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(Colors.red),
                      // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
                      // ))
                    ],
=======
      resizeToAvoidBottomInset: false,
     
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(padding: EdgeInsets.all(80.0)),
            CircleAvatar(
                radius: 250,
                
                backgroundColor: Colors.white,
                child: Image.asset('images/logo.png')),
            Padding(padding: EdgeInsets.all(30.0)),
            // Center(
            //   child: Text("StudentZone",
            //       style: TextStyle(color: Colors.red, fontSize: 30)),
            // ),
            // Padding(padding: EdgeInsets.all(40.0)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //     new ElevatedButton(onPressed: null, child: Text('LOGIN'),
                  //     style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(Colors.white),
                  //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
                  //   ),
                  // ),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => login()),
                        (_) => false,
                      );
                    },
                    child: Text('LOG IN'),
                    color: Colors.white,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 2)),
                    padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => register()),
                        (_) => false,
                      );
                    },
                    child: Text('REGISTER'),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2)),
                    padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
>>>>>>> cd846c52c9397c32ea68be8aeae150efdb5a48c5
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
