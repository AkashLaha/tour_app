import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.grey[700], borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Not Interested',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}
