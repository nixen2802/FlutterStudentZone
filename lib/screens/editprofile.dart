import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:studentzone/screens/profile.dart';
import 'package:studentzone/widgets/changescreen.dart';
import '../widgets/mybutton.dart';
import 'package:studentzone/widgets/passwordtextformfield.dart';

import 'base.dart';

class editprofile extends StatefulWidget {
  static const routeName = '/editprofile';
  @override
  _editprofileState createState() => _editprofileState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
TextEditingController email1 = TextEditingController();
TextEditingController userName1 = TextEditingController();
TextEditingController phoneNumber1 = TextEditingController();
TextEditingController password1 = TextEditingController();
TextEditingController address1 = TextEditingController();

bool isMale = true;
bool isLoading = false;

class _editprofileState extends State<editprofile> {
  void submit() async {
    try {
      setState(() {
        isLoading = true;
      });
      // result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: email.text, password: password.text);
      // print(result);

      FirebaseFirestore.instance.collection("User").doc(userUid).update({
        "UserName": userName1.text,
        "UserEmail": email1.text,
        "UserAddress": address1.text,
        "UserGender": isMale == true ? "Male" : "Female",
        "UserNumber": phoneNumber1.text,
      });
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
    }

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => base()));
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() async {
    if (userName1.text.isEmpty &&
        email1.text.isEmpty &&
        phoneNumber1.text.isEmpty &&
        address1.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName1.text.length < 6) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (email1.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email1.text)) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
    }  else if (phoneNumber1.text.length < 11 || phoneNumber1.text.length > 11) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else if (address1.text.isEmpty) {
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Address Is Empty "),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            // initialValue: "rushabh",
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'userName1',
            ),
            controller: userName1,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
            ),
            controller: email1,
          ),
          SizedBox(
            height: 10,
          ),
          // PasswordTextFormField(
          //   obserText: obserText,
          //   name: "password1",
          //   controller: password1,
          //   onTap: () {
          //     FocusScope.of(context).unfocus();
          //     setState(() {
          //       obserText = !obserText;
          //     });
          //   },
          // ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      isMale == true ? "Male" : "Female",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
            ),
            controller: phoneNumber1,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Address',
            ),
            controller: address1,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          SizedBox(
            height: 10,
          ),
          isLoading == false
              ? MyButton(
                  name: "Submit",
                  onPressed: () {
                    vaildation();
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          SizedBox(
            height: 20,
          ),
          ChangeScreen(
            name: "Cancel",
            whichAccount: " ",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => base(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    userName1.text = name;
    email1.text = email;
    phoneNumber1.text = phonenubmer;
    // password1.text = ;
    if (gender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
    address1.text = address;
  }

  @override
  Widget build(BuildContext context) {
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
            }),
        title: Text("Edit Profile"),
      ),
      key: _scaffoldKey,
      body: ListView(
        children: [
          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Edit profile",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 570,
            child: _buildBottomPart(),
          ),
        ],
      ),
    );
  }
}
