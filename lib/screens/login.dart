import 'package:flutter/material.dart';
import 'base.dart';
import 'profile.dart';

class login extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text("StudentZone")
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                   ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                new TextField(
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                new TextField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0)
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: (){
                     Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => base()),
                        (_) => false,
                      );
                  },
                  child: Text('LOG IN'),
                  color: Colors.red,
                  textColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.fromLTRB(132, 20, 130, 20),),
              ],
            )
        )
    );
  }
}
