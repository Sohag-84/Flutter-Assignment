import 'package:flutter/material.dart';
import 'package:flutter_task/model/order_model.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';

class OrderListScreen extends StatelessWidget {
  final Order order;
  const OrderListScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order List"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                order.toJson().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
