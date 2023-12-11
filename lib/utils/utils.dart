import 'package:flutter/material.dart';
import 'package:flutter_task/constant/colors.dart';
import 'package:get/get.dart';

snackBar({
  required title,
  required String description,
  Color bgColor = primaryColor,
}) {
  return Get.snackbar(
    title,
    description,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgColor,
  );
}
