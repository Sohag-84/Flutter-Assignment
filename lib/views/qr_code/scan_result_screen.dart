import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';

class ScanResultScren extends StatelessWidget {
  final String data;
  const ScanResultScren({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Scan Result"),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
