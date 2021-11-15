import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 180,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 120, height: 52),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 18,
                ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
