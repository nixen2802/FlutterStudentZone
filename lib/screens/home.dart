import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text("StudentZone")
      ),
   body: StreamBuilder(

stream: FirebaseFirestore.instance.collection('product').snapshots(),
builder: (context, snapshot){

if(!snapshot.hasData) return const Text('loading....');

return ListView.builder(
itemExtent: 80.0,
itemCount: (snapshot.data! as QuerySnapshot).docs.length,
itemBuilder: (context, index) =>
_buildListItem(context, (snapshot.data! as QuerySnapshot).docs[index]),

);
}));


}













// @override

Widget _buildListItem(BuildContext context, DocumentSnapshot document ){
return ListTile(
title: Row(
children: [

Expanded(
child: Text(
document['Name'],
style: Theme.of(context).textTheme.headline,
),
),
Container(
decoration: const BoxDecoration(
color: Color(0xffdd),
),
padding: const EdgeInsets.all(10.0),
child: Text(
document['price'].toString(),
style: Theme.of(context).textTheme.display1,

),
),
],
),

);


}






}

