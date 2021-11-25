import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentzone/provider/productprovider.dart';
import 'package:studentzone/screens/category.dart';
import 'package:studentzone/screens/editprofile.dart';
import 'package:studentzone/screens/editproducts.dart';
import 'package:studentzone/screens/home.dart';
import 'package:studentzone/screens/login1.dart';
import 'package:studentzone/screens/productdetail.dart';
import 'package:studentzone/screens/splashscreen.dart';
import 'screens/splashscreen.dart';
import 'screens/login.dart';
import 'screens/productdetail.dart';
import 'screens/register.dart';
import 'screens/register1.dart';
import 'screens/profile.dart';
import 'screens/base.dart';
import 'screens/productdetail.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

DocumentSnapshot detaildoc =(FirebaseFirestore.instance.collection('product').snapshots() as QuerySnapshot).docs[0];

// DocumentSnapshot doc1 = detaildoc[0];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<CategoryProvider>(
        //   create: (context) => CategoryProvider(),
        // ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            return base();
            } else {
            return splashscreen();
            }
          },
        ),
        routes: {
          splashscreen.routeName: (context) => splashscreen(),
          login.routeName: (context) => login(),
          login1.routeName: (context) => login1(),
          register.routeName: (context) => register1(),
          register.routeName: (context) => register(),
          category.routeName: (context) => category(),
          productdetail.routeName: (context) => productdetail(
                doc: detaildoc, uiduser: "12345",
              ),
          profile.routeName: (context) => profile(),
          editprofile.routeName: (context) => editprofile(),
          editproducts.routeName: (context) => editproducts(),
          base.routeName: (context) => base(),
        },
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Zone',
//       theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
//       home: splashscreen(),
//       routes: {
//         splashscreen.routeName: (context) => splashscreen(),
//         login.routeName: (context) => login(),
//         login1.routeName: (context) => login1(),
//         register.routeName: (context) => register1(),
//         register.routeName: (context) => register(),
//         profile.routeName: (context) => profile(),
//         base.routeName: (context) => base(),
//       },
//     );
//   }

 
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Colors.red,
//         ),
        
     

//         );
//   }

