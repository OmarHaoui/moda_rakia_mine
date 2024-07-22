import 'package:flutter/material.dart';
import 'package:modarakia/utils/constants.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
          child: Text(
        content,
        textAlign: TextAlign.center,
      )),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
      backgroundColor: AppColor.secondaryColor,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ), // Example radius
        borderSide: BorderSide.none,
      ),
    ),
  );
}
