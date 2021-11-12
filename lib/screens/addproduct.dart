import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentzone/screens/profile.dart';
import 'package:studentzone/widgets/mybutton.dart';
import 'package:studentzone/widgets/mytextformfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:fluttertoast/fluttertoast.dart';

String url = "null";
String imagecheck = " ";
String dropdownValue = 'Others';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
final fieldText = TextEditingController();
final TextEditingController ProductName = TextEditingController();
final TextEditingController Price = TextEditingController();
bool isLoading = false;

class addproduct extends StatefulWidget {
  @override
  _addproductState createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  FirebaseStorage storage = FirebaseStorage.instance;

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      print(fileName);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
              imageFile,
            );
        url = await storage.ref(fileName).getDownloadURL();
        print(url);

        Fluttertoast.showToast(
          msg: "Image uploaded successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
        // Refresh the UI
        setState(() {
          imagecheck = "Image uploaded successfully";
        });
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        new Container(
          padding: EdgeInsets.fromLTRB(50, 75, 50, 25),
          child: Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () => _upload('camera'),
                  icon: Icon(Icons.camera),
                  label: Text('camera')),
              SizedBox(
                width: 15,
              ),
              ElevatedButton.icon(
                  onPressed: () => _upload('gallery'),
                  icon: Icon(Icons.library_add),
                  label: Text('Gallery')),
            ],
          ),
        ),
        Text(imagecheck),
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
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down_circle),
          iconSize: 24,
          elevation: 18,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            width: double.infinity,
            color: Colors.red,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Others', 'Electronics', 'Books & Study Materials', 'Fashion', 'Furniture']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10,
        ),
        isLoading == false
            ? MyButton(
                name: "add",
                onPressed: () {
                  submit();
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
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
        "Name": ProductName.text,
        "price": Price.text,
        "image": url,
        "userid": userUid,
        "category":dropdownValue,
        // "image": AssetImage("images/logo.png")
      });

      setState(() {
        isLoading = false;
      });
      ProductName.clear();
      Price.clear();
      imagecheck = " ";

      Fluttertoast.showToast(
        msg: "product uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 1200),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
      ProductName.clear();
      Price.clear();
      imagecheck = " ";
      Fluttertoast.showToast(
        msg: "System error occured try contacting admin",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }

    // setState(() {
    //   isLoading = false;
    // });
  }
}
