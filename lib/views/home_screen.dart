// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';
import 'package:flutter_task/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              customButton(onTap: () {}, btnName: "Scan Qr Code"),
              SizedBox(height: 20),
              customButton(onTap: () {}, btnName: "Geo Punch Submit"),
              SizedBox(height: 20),
              customButton(onTap: () {}, btnName: "Submit Order"),
            ],
          ),
        ),
      ),
    );
  }
}
