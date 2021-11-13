import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentzone/screens/productdetail.dart';
import 'package:studentzone/screens/profile.dart';

class myproducts extends StatefulWidget {
  @override
  _myproductsState createState() => _myproductsState();
}

class _myproductsState extends State<myproducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red, title: Text("StudentZone")),
        body: Container(
            child: StreamBuilder(

                stream: FirebaseFirestore.instance
                    .collection('product')
                    .where('userid',isEqualTo: userUid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('loading....');

                  return GridView.builder(
                    // itemExtent: 80.0,
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,

                    itemBuilder: (context, index) => _buildListItem(
                        context, (snapshot.data! as QuerySnapshot).docs[index]),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 8.0 / 10.0,
                      crossAxisCount: 2,
                    ),
                  );
                })));
  }

// @override

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    DocumentSnapshot doc = document;
    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var price = document['price'];
    var name = document['Name'];
    
       return GestureDetector(
        onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => productdetail(
                      doc:doc),
                ),
              )

             
            },
        child: Card(
          child: Container(
            height: height * 0.3,
            width: width * 0.2 * 2 + 10,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(document['image']),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "\Rs ${price.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xff9b96d6)),
                      ),
                      Container(
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


