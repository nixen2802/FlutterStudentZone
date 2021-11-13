import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';

class productdetail extends StatefulWidget {
  static const routeName = '/productdetail';

  const productdetail(
      {Key? key,
      
      required this.doc})
      : super(key: key);

  // Declare a field that holds the Todo.
  final doc;
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
                  ),
                )),
        title: Text("Details Page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width - 50,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.doc['image']),
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Divider(
                height: 1,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Product Name : " + widget.doc['Name']
                  ),
                  Text("Product Price : " + widget.doc['price']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
