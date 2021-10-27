import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class profile extends StatefulWidget {
  static const routeName = '/profile';
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
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
          Text('Nayan Mandliya',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Padding(padding: EdgeInsets.fromLTRB(100, 20, 100, 0)),
          Text('nayan@gmail.com',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
          ),
        ],
      ),
    );
  }
}
