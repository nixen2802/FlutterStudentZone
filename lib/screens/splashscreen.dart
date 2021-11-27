import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentzone/screens/login1.dart';
import 'package:studentzone/screens/register1.dart';

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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 250,
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/logo.png')),
            Padding(padding: EdgeInsets.all(30.0)),
            
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 120, height: 60),
                    child: new ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => login1()),
                          (_) => false,
                        );
                      },
                      child: Text('LOG IN'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      // 
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 120, height: 60),
                    child: new ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => register1()),
                          (_) => false,
                        );
                      },
                      child: Text('REGISTER'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      // 
                    ),
                  ),
                  // 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
