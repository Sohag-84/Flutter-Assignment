// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_task/model/order_model.dart';
import 'package:flutter_task/utils/utils.dart';
import 'package:flutter_task/views/product/order_list.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final shopName = ''.obs;
  final phoneNumber = ''.obs;
  final items = <Item>[].obs;

  final shopNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final itemNameController = TextEditingController();
  final quantityController = TextEditingController();

  final shopNameFormKey = GlobalKey<FormFieldState>();
  final phoneNumberFormKey = GlobalKey<FormFieldState>();
  final itemNameFormKey = GlobalKey<FormFieldState>();
  final quantityFormKey = GlobalKey<FormFieldState>();

  String? shopNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter shop name';
    }
    return null;
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    return null;
  }

  String? itemNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter item name';
    }
    return null;
  }

  String? quantityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter quantity';
    }
    final quantity = int.tryParse(value);
    if (quantity == null || quantity <= 0) {
      return 'Please enter a valid quantity';
    }
    return null;
  }

  void addOrder() {
    final itemName = itemNameController.text.trim();
    final quantity = int.tryParse(quantityController.text.trim()) ?? 0;

    final itemNameState = itemNameFormKey.currentState;
    final quantityState = quantityFormKey.currentState;

    if (itemNameState!.validate() && quantityState!.validate()) {
      if (items.length < 10) {
        items.add(Item(itemName, quantity));
        itemNameController.clear();
        quantityController.clear();
        snackBar(
          title: "Item Added",
          description: "$itemName added to the order",
        );
      } else {
        snackBar(
          title: "Error",
          description: "Maximum 10 items allowed per order.",
          bgColor: Colors.red,
        );
      }
    }
  }

  void submitOrder() {
    final shopNameState = shopNameFormKey.currentState;
    final phoneNumberState = phoneNumberFormKey.currentState;

    if (shopNameState!.validate() && phoneNumberState!.validate()) {
      if (items.isNotEmpty) {
        Order order = Order(shopName.value, phoneNumber.value, items);

        Get.to(() => OrderListScreen(order: order));
      } else {
        snackBar(
          title: "Error",
          description: "Your cart is empty",
        );
      }
    }
  }
}
