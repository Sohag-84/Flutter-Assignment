// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/order_controller.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';
import 'package:flutter_task/widgets/custom_button.dart';
import 'package:get/get.dart';

class ProductOrderScreen extends StatelessWidget {
  ProductOrderScreen({super.key});

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order Submit"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: customButton(
            onTap: () {
              orderController.submitOrder();
            },
            btnName: "Submit Order"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: orderController.shopNameController,
              key: orderController.shopNameFormKey,
              validator: orderController.shopNameValidator,
              decoration: InputDecoration(
                labelText: 'Shop Name',
                contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: orderController.phoneNumberController,
              key: orderController.phoneNumberFormKey,
              validator: orderController.phoneNumberValidator,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: orderController.itemNameController,
              key: orderController.itemNameFormKey,
              validator: orderController.itemNameValidator,
              decoration: InputDecoration(
                labelText: 'Product Name',
                contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: orderController.quantityController,
              key: orderController.quantityFormKey,
              validator: orderController.quantityValidator,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
                contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 150,
              child: customButton(
                onTap: () {
                  orderController.addOrder();
                },
                btnName: "Add Order",
                btnHeight: 40,
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: orderController.items.length,
                  itemBuilder: (context, index) {
                    final item = orderController.items[index];
                    return ListTile(
                      title: Text('${item.itemName} (${item.quantity})'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
