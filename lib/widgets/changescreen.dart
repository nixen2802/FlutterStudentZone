import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final Function onTap;
  final String name;
  ChangeScreen({required this.name, required this.onTap,required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(whichAccount, style: TextStyle(
          fontSize: 16
        ),),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () =>onTap(),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}