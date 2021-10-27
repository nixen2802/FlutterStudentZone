import 'package:flutter/material.dart';

class addproduct extends StatefulWidget {
  @override
  _addproductState createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
       
        Text("addproduct"),
        SizedBox(
          height: 10,
        ),
      ]),


    );
  }
}
