// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(CustomButton());

class CustomButton extends StatelessWidget {
  late String TextFill;
  bool isSelected = false;
  Color Newcolor = Colors.red;
  CustomButton();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Data",
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red : Colors.black,
      ),
      onPressed: () {
        setstate() {
          isSelected = true;
        }
      },
    );
  }
}
