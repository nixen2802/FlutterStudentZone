// import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';
import 'package:studentzone/widgets/mybutton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

String ownerName = "Admin";
String ownerEmail = "AdminEmail";
String ownerAddress = "Admin adress";
String ownerPhone = "98989898989";
String ownerId = "123";
bool buttonpress = false;

Future<void> mail() async {
  final mailto = Mailto(
    to: [
      'example@example.com',
      'ejemplo@ejemplo.com',
    ],
    cc: [
      'percentage%100@example.com',
      'QuestionMark?address@example.com',
    ],
    bcc: [
      'Mike&family@example.org',
    ],
    subject: 'Let\'s drink a "café"! ☕️ 2+2=4 #coffeeAndMath',
    body:
        'Hello this if the first line!\n\nNew line with some special characters őúóüűáéèßáñ\nEmoji: 🤪💙👍',
  );

  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  String renderHtml(Mailto mailto) =>
      '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
  await for (HttpRequest request in server) {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.html
      ..write(renderHtml(mailto));
    await request.response.close();
  }
}

//
Future<void> getmyuser(String uiduser) async {
  var document1 =
      await FirebaseFirestore.instance.collection('User').doc(uiduser).get();

  ownerName = document1['UserName'];
  ownerEmail = document1['UserEmail'];
  ownerPhone = document1['UserNumber'];
  ownerAddress = document1['UserAddress'];
  ownerId = document1['UserId'];
}

Future<void> _makingPhoneCall() async {
  const url = 'tel:9876543210';
  try {
    await launch(url);
  } catch (e) {
    print(e);
  }
}

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
    var uiduser = widget.doc['userid'];
    // buttonpress = false;
    // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+uiduser);
    getmyuser(uiduser);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => base(),
                ),
              );
              setState(() {
                buttonpress = false;
              });
            }),
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
                      style: TextStyle(fontSize: 22),
                    ),
                    // Text( widget.doc['Name'],
                    // style: TextStyle(fontSize: 28),
                    // ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.doc['Name'],
                      style: TextStyle(fontSize: 20),
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.doc['description'],
                      style: TextStyle(fontSize: 15),
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
                    Column(children: [
                      Text(ownerName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      // Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                      // Text(ownerEmail,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 15)),
                      // Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
                    ])
                  ]),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  MyButton(
                      name: "Get details",
                      onPressed: () {
                        setState(() {
                          buttonpress = true;
                        });
                      }),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  buttonpress == true
                      ? Container(
                          child: Column(children: [
                            Text(ownerName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(ownerEmail,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(ownerPhone,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(ownerAddress,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 160,
                                  // width: double.infinity,
                                  child: RaisedButton(
                                    child: Text(
                                      "call",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.red,
                                    onPressed: _makingPhoneCall,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 45,
                                  width: 160,
                                  // width: double.infinity,
                                  child: RaisedButton(
                                    child: Text(
                                      "Mail",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    color: Colors.white,
                                    // textColor: Colors.black,
                                    onPressed: mail,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        )
                      : SizedBox(
                          height: 25,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
