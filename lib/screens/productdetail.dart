import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';

class productdetail extends StatefulWidget {
  static const routeName = '/productdetail';
  @override
  _productdetailState createState() => _productdetailState();
}

class _productdetailState extends State<productdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
       icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => base(),
                        ),)
        ),
        title: Text("product screen"),
      ),
      body: Text("details"),
    );
  }
}
