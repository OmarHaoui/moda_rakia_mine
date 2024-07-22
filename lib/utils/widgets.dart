import 'package:flutter/material.dart';
import 'package:modarakia/utils/constants.dart';

class defaultButtton extends StatelessWidget {
  defaultButtton({
    required this.onPressed,
    required this.childText,
    required this.halfWidth,
    required this.halfHeight,
  });
  dynamic Function() onPressed;
  String childText;
  double halfWidth;
  double halfHeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColor.primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: halfWidth, vertical: halfHeight),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(childText),
    );
  }
}
