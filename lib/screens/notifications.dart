import 'package:flutter/material.dart';

class notifications extends StatefulWidget {
  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
       
        Text("notifications"),
        SizedBox(
          height: 10,
        ),
      ]),


    );
  }
}
