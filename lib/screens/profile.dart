import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

 var userUid = 'TcwJYWAC24aVJJEzWpWrDd7tLwf2';
var name;
var email;
var phonenubmer;
var gender;
var address;
// final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> getUserUid() async {
  User user = await FirebaseAuth.instance.currentUser!;
  userUid = user.uid;
  // here you write the codes to input the data into firestore
}
// void getUserUid() {
//   User? myUser = FirebaseAuth.instance.currentUser;
//   userUid = myUser!.uid;
// }

class profile extends StatefulWidget {
  static const routeName = '/profile';
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    //  body:();

    getUserUid();
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('User').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var myDoc = (snapshot.data! as QuerySnapshot).docs;

              // print(myDoc["UserEmail"]);
              // User? myUser = FirebaseAuth.instance.currentUser;
              // print(FirebaseAuth.instance);
              //  userUid = myUser!.uid;
             

              myDoc.forEach((myDoc) {
                print(myDoc['UserId']);
                print(userUid);
                if (myDoc['UserId'] == userUid) {
                  email = myDoc["UserEmail"];
                  print(email);
                  // userImage: myDoc.data()["UserImage"];
                  address = myDoc["UserAddress"];
                  gender = myDoc["UserGender"];
                  name = myDoc["UserName"];
                  phonenubmer = myDoc["UserNumber"];
                }
              });
              // return GridView.builder(
              //   // itemExtent: 80.0,
              //   itemCount: (snapshot.data! as QuerySnapshot).docs.length,
              //   itemBuilder: (context,index) => _buildprofileitem(
              //       context

              //   ),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           // childAspectRatio: 8.0 / 10.0,
              //           crossAxisCount: 1,
              //         ),

              // );

              return Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(100, 50, 100, 0)),
                      CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg')),
                      Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      Text(email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      new RaisedButton(
                        onPressed: () {
                          print("Null");
                        },
                        child: Text('EDIT PROFILE'),
                        color: Colors.red,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red, width: 2)),
                        padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      new RaisedButton(
                        onPressed: () {
                          print("Null");
                        },
                        child: Text('ADDS'),
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2)),
                        padding: EdgeInsets.fromLTRB(125, 20, 120, 20),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      Container(
                        height: 150.0,
                        width: 400.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
