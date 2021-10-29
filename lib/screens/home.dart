import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text("StudentZone")
      ),
       body: new Container(
      decoration: new BoxDecoration(color: Colors.white),
     
      child:Container( 
        padding: new EdgeInsets.fromLTRB(5, 10, 5, 2),
       child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text("home"),
       
        new TextField(
          decoration: InputDecoration(
              hintText: 'Search items',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0))),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    ))
    );
  }
}
