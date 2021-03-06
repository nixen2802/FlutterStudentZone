
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentzone/screens/base.dart';
import 'package:studentzone/screens/profile.dart';
import 'package:studentzone/widgets/mybutton.dart';
import 'package:url_launcher/url_launcher.dart';

String ownerName = "Admin";
String ownerEmail = "AdminEmail";
String ownerAddress = "Admin adress";
String ownerPhone = "9898989898";
String ownerId = "123";
String productname = "sample";
bool buttonpress = false;

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> getmyuser(String uiduser) async {
  var document1 =
      await FirebaseFirestore.instance.collection('User').doc(uiduser).get();

  ownerName = document1['UserName'];
  ownerEmail = document1['UserEmail'];
  ownerPhone = document1['UserNumber'];
  ownerAddress = document1['UserAddress'];
  ownerId = document1['UserId'];
}

class productdetail extends StatefulWidget {
  static const routeName = '/productdetail';

  const productdetail({Key? key, required this.doc, required this.uiduser})
      : super(key: key);

  // Declare a field that holds the Todo.
  final doc;
  final uiduser;

  @override
  _productdetailState createState() => _productdetailState();
}

class _productdetailState extends State<productdetail> {
  @override
  void initState() {
    super.initState();
    getmyuser(widget.uiduser);
    productname = widget.doc['Name'];
  }

  @override
  Widget build(BuildContext context) {
    // print(uiduser);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              setState(() {
                buttonpress = false;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => base(),
                ),
              );
            }),
        title: Text("Details Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Column(
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
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rs." + widget.doc['price'],
                        style: TextStyle(fontSize: 20),
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
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
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
                    Container(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Posted on: " +
                            widget.doc['upload_date'].toDate().toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                    Row(children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://previews.123rf.com/images/jemastock/jemastock1706/jemastock170608711/80128439-young-and-successful-business-man-cartoon-employee-work.jpg'),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 15,0 )),
                      Container(
                        height: 45,
                        width: 160,
                        // width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            "Get details",
                            style: TextStyle(color: Colors.white),
                          ),
                          // color: Colors.red,
                          onPressed: () {
                            setState(() {
                              buttonpress = true;
                            });
                          },
                        ),
                      ),
                    ]),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                    buttonpress == true
                        ? Container(
                            child: Column(
                              children: [
                                Text(ownerName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(ownerEmail,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(ownerPhone,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(ownerAddress,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 140,
                                      // width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          textStyle: MaterialStateProperty.all(
                                            TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: Wrap( 
                                          children: <Widget>[
                                            Icon(Icons.call),
                                            Text(
                                              "Call",
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                          ]
                                        ),
                                        // color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            _makePhoneCall('tel:$ownerPhone');
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 140,
                                      // width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  color: Colors.black,
                                                  width: 1)),
                                          textStyle: MaterialStateProperty.all(
                                            TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: Wrap( 
                                          children: <Widget>[
                                            Icon(Icons.mail_outline_rounded),
                                            Text(
                                          "Mail",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                          ]
                                        ),
                                        // color: Colors.white,
                                        // textColor: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            _makePhoneCall(
                                                'mailto:$ownerEmail?subject=Product%20Info%20-$productname &body=Hello%20I%20like%20to%20know%20about%20your%20product%20$productname%20which%20is%20listed%20on%20studentzone');
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 2,
                          ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
