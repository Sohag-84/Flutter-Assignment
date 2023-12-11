// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';
import 'package:flutter_task/widgets/custom_button.dart';

class ProductOrderScreen extends StatelessWidget {
  const ProductOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order Submit"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: customButton(onTap: () {}, btnName: "Submit Order"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Shop Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Item Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 150,
              child: customButton(
                onTap: () {},
                btnName: "Add Order",
                btnHeight: 40,
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                itemCount: 23,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Table (1)"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
