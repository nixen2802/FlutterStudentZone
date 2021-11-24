import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentzone/screens/editprofile.dart';
import 'package:studentzone/widgets/changescreen.dart';
import '../widgets/mybutton.dart';

import 'login1.dart';

var userUid = 'Hv1CMbMn4cdO06ObbqlFrYu6W8Z2';
var name;
var email;
var phonenubmer;
var gender;
var address;
String profileimgurl =
    "https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg";

// final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> getUserUid() async {
  User user = await FirebaseAuth.instance.currentUser!;
  userUid = user.uid;
  // here you write the codes to input the data into firestore
}

Future<void> signOut() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
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
                // print(myDoc['UserId']);
                // print(userUid);
                if (myDoc['UserId'] == userUid) {
                  email = myDoc["UserEmail"];
                  // print(email);
                  // userImage: myDoc.data()["UserImage"];
                  address = myDoc["UserAddress"];
                  gender = myDoc["UserGender"];
                  if (gender == 'Female') {
                    profileimgurl =
                        "https://t4.ftcdn.net/jpg/02/78/70/99/360_F_278709964_PhS3MsOE9udVYb5VCin1xCQJlm3HFb9V.jpg";
                  }
                  if (gender == 'Male') {
                    profileimgurl =
                        "https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg";
                  }

                  name = myDoc["UserName"];
                  phonenubmer = myDoc["UserNumber"];
                }
              });

              return Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(100, 50, 100, 0)),
                      CircleAvatar(
                          radius: 150,
                          backgroundImage: NetworkImage(profileimgurl)),
                      Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      Text(email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
//                       var phonenubmer;
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(0, 20, 100, 20)),
                          Icon(
                            Icons.home_rounded,
                            size: 22,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(address,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(0, 20, 100, 20)),
                          Icon(
                            Icons.call_rounded,
                            size: 22,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(phonenubmer,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Padding(padding: EdgeInsets.only(left: 50)),
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 120, height: 60),
                              child: new ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => editprofile(),
                                    ),
                                  );
                                },
                                child: Text('EDIT PROFILE'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // MyButton(
                            //   name: "EDIT PROFILE",
                            //   onPressed: () {
                            //     Navigator.of(context).pushReplacement(
                            //       MaterialPageRoute(
                            //         builder: (ctx) => editprofile(),
                            //       ),
                            //     );
                            //   },
                            //   // child: Text('EDIT PROFILE'),
                            //   // color: Colors.red,
                            //   // textColor: Colors.white,
                            //   // shape: RoundedRectangleBorder(
                            //   //     side: BorderSide(color: Colors.red, width: 2)),
                            //   // padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                            // ),
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 120, height: 60),
                              child: new ElevatedButton(
                                onPressed: () {
                                  signOut();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => login1(),
                                    ),
                                  );
                                },
                                child: Text('LOGOUT'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // new RaisedButton(
                      //   onPressed: () {
                      //     signOut();
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //         builder: (ctx) => login1(),
                      //       ),
                      //     );
                      //   },
                      //   child: Text('Log Out'),
                      //   color: Colors.white,
                      //   textColor: Colors.black,
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.black, width: 2)),
                      //   padding: EdgeInsets.fromLTRB(125, 20, 120, 20),
                      // ),
                      // Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                    ],
                  ));
            }));
  }
}
