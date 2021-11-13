import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';

class productdetail extends StatefulWidget {
  static const routeName = '/productdetail';

  const productdetail({Key? key, required this.doc}) : super(key: key);

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
                height: 250,
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
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rs." + widget.doc['price'],
                      style: TextStyle(fontSize: 28),
                    ),
                    // Text( widget.doc['Name'],
                    // style: TextStyle(fontSize: 28),
                    // ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.doc['Name'],
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.doc['description'],
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Row(children: [
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg')),
                    Column(        
                    children:[Text("Rushabh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    // Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                    Text("rushabh@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    // Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                    ])
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
