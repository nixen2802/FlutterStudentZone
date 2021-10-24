import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
       
        Text("home"),
        SizedBox(
          height: 10,
        ),
      ]),


    );
  }
}
