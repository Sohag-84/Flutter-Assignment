import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/custom_appbar.dart';

class ScanQrCodeScren extends StatelessWidget {
  const ScanQrCodeScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Qr Code Scan"),
    );
  }
}
