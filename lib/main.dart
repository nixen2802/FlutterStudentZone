import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      // body: new Container(
      //   padding: new EdgeInsets.all(32.0),
      //   child: new Center(
      //     child: new Column(
      //       children: [
      //         new Text('REGISTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Name',
      //             enabledBorder: const OutlineInputBorder(
      //                       borderSide: const BorderSide(color: Colors.black, width: 2.0),
      //                     ),
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Email address',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Phone Number',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Confirm password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new ElevatedButton(onPressed: null,
      //         child: Center(
      //           child: Text('REGISTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red)),
      //         ),
      //         style: ElevatedButton.styleFrom(
      //           fixedSize: Size(314,60),
      //           primary: Colors.red,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20)
      //           )
      //           ),
      //         )
      //       ],
      //     )
      //   )
      // )

      // body: new Container(
      //   padding: new EdgeInsets.all(32.0),
      //   child: new Center(
      //     child: new Column(
      //       children: [
      //         Padding(padding: EdgeInsets.all(50.0)),
      //         new Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Email address',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new TextField(
      //           decoration: InputDecoration(
      //             hintText: 'Password',
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black, width: 2.0)
      //             )
      //           ),
      //         ),
      //         Padding(padding: EdgeInsets.all(10.0)),
      //         new ElevatedButton(onPressed: null,
      //         child: Center(
      //           child: Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red)),
      //         ),
      //         style: ElevatedButton.styleFrom(
      //           fixedSize: Size(314,60),
      //           primary: Colors.red,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20)
      //           )
      //           ),
      //         )
      //       ],
      //     )
      //   )
      // )


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "StudentZone",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30
              )
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: [
              new ElevatedButton(onPressed: null, child: Text('LOGIN'), style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
              )),
              new ElevatedButton(onPressed: null, child: Text('REGISTER'), style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
              ))
            ])
              )
            ),
          ],
        ),
      ),
    );
  }
}
