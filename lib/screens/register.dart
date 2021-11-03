import 'package:flutter/material.dart';
import 'base.dart';
import 'profile.dart';

class register extends StatefulWidget {
  static const routeName = '/register';

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backgroundColor: Colors.red, title: Text("StudentZone")),
        body: ListView(shrinkWrap: true, children: [
          new Container(
              padding: new EdgeInsets.all(32.0),
              child: new Center(
                  child: new Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.white,
                      child: Text('REGISTER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20.0)),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: 'Email address',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: 'Confirm password',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => base()),
                        (_) => false,
                      );
                    },
                    child: Text('REGISTER'),
                    color: Colors.red,
                    textColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.fromLTRB(125, 20, 130, 20),
                  ),
                ],
              )))
        ]));
  }
}
