// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/qr_code_controller.dart';
import 'package:flutter_task/views/google_map/screens/geo_punch_submit_screen.dart';
import 'package:flutter_task/views/product/order_screen.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';
import 'package:flutter_task/widgets/custom_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final QrCodeController controller = Get.put(QrCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Home Page"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton(
                onTap: () {
                  controller.scanQrCode();
                },
                btnName: "Scan Qr Code",
              ),
              SizedBox(height: 20),
              customButton(
                  onTap: () {
                    Get.to(() => GeoPunchSubmitScreen());
                  },
                  btnName: "Geo Punch Submit"),
              SizedBox(height: 20),
              customButton(
                onTap: () {
                  Get.to(() => ProductOrderScreen());
                },
                btnName: "Submit Order",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
