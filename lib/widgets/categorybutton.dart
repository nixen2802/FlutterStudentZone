import 'package:flutter/material.dart';

class categorybutton extends StatelessWidget {
  final Function onPressed;
  // final String name;
  final IconData caticons;
  final Color coloricon;
  final String categorytext;
  categorybutton(
      {required this.caticons,
      required this.coloricon,
      required this.categorytext,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    //

    return Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(coloricon),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ))),
            // color: coloricon,

            child: Icon(
              caticons,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => onPressed(),
          ),
          Text(categorytext),

          // ,
        ],
      ),
    );
  }
}
