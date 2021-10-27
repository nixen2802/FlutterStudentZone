import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
       
        Text("screen 3"),
        SizedBox(
          height: 10,
        ),
      ]),


    );
  }
}
