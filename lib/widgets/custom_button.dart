import 'package:flutter/material.dart';
import 'package:flutter_task/constant/colors.dart';

InkWell customButton({required VoidCallback onTap, required String btnName}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        btnName,
        style: TextStyle(color: whiteColor, fontSize: 16),
      ),
    ),
  );
}
