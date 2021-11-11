import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';

class productdetail extends StatefulWidget {
  static const routeName = '/productdetail';

  const productdetail({Key? key, required this.price, required this.name, required this.image}) : super(key: key);

  // Declare a field that holds the Todo.
  final name;
  final price;
  final image;
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
        title: Text(widget.name),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
            Text("Price of the product : " + widget.price),
          ],
        ),
      ),
    );
  }
}
