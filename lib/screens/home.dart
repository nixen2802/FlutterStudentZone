import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:carousel_pro/carousel_pro.dart';

 
class home extends StatefulWidget {
  
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
        appBar: AppBar(backgroundColor: Colors.red, title: Text("StudentZone")),
        body:Container(
          
        child: StreamBuilder(
          
          // child:_buildImageSlider(),
            stream:
                FirebaseFirestore.instance.collection('product').snapshots(),
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
            }
            )
            )
            );
  }

// @override

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
// return ListTile(
// title: Row(
// children: [

// Expanded(
// child: Text(
// document['Name'],
// style: Theme.of(context).textTheme.headline,
// ),
// ),
// Container(
// decoration: const BoxDecoration(
// color: Color(0xffdd),
// ),
// padding: const EdgeInsets.all(10.0),
// child: Text(
// document['price'].toString(),
// style: Theme.of(context).textTheme.display1,

// ),
// ),
// ],
// ),

// );

// }

    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var price = document['price'];
    var name = document['Name'];
    // var img = Image.network(document['image']);
    return Card(
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
    );
  }
}


// Widget _buildImageSlider() {
//     var height;
//     return Container(
//       height: height * 0.3,
//       child: Carousel(
//         autoplay: true,
//         showIndicator: false,
//         images: [
//           AssetImage("images/man.jpg"),
//           AssetImage("images/women.jpg"),
//           AssetImage("images/camera.jpg"),
//         ],
//       ),
//     );
//   }