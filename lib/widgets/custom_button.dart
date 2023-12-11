import 'package:flutter/material.dart';
import 'package:flutter_task/constant/colors.dart';

InkWell customButton({
  required VoidCallback onTap,
  required String btnName,
  double fontSize = 16,
  double btnHeight = 45,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: btnHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        btnName,
        style: TextStyle(
          color: whiteColor,
          fontSize: fontSize,
        ),
      ),
    ),
  );
}
