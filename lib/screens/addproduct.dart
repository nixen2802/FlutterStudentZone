
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentzone/widgets/mybutton.dart';
import 'package:studentzone/widgets/mytextformfield.dart';
import 'package:path/path.dart' as Path; 



final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
final TextEditingController ProductName = TextEditingController();
final TextEditingController Price = TextEditingController();
bool isLoading = false;

class addproduct extends StatefulWidget {
  @override
  _addproductState createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Add Product",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        MyTextFormField(
          name: "Product Name",
          controller: ProductName,
        ),
        SizedBox(
          height: 10,
        ),
        MyTextFormField(
          name: "Price",
          controller: Price,
        ),
        SizedBox(
          height: 10,
        ),
        MyButton(
                  name: "add",
                  onPressed: () {
                    submit();
                  },
                )
      ]),
    );
  }

  void submit() async {
    // UserCredential result;
    try {
      setState(() {
        isLoading = true;
      });

      FirebaseFirestore.instance.collection("product").doc().set({
        // "UserName": userName.text,
        // "UserId": result.user!.uid,
        // "UserEmail": email.text,
        // "UserAddress": address.text,
        // "UserGender": isMale == true ? "Male" : "Female",
        // "UserNumber": phoneNumber.text,
        "Name": ProductName.text,
        "price": Price.text,
        // "image": AssetImage("images/logo.png")
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
  }
}
