import 'package:flutter/material.dart';

class myproducts extends StatefulWidget {
  @override
  _myproductsState createState() => _myproductsState();
}

class _myproductsState extends State<myproducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
       
        Text("myproducts"),
        SizedBox(
          height: 10,
        ),
      ]),


    );
  }
}
