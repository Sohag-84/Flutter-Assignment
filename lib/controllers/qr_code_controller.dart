import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_task/views/qr_code/scan_result_screen.dart';
import 'package:get/get.dart';

class QrCodeServices {}

class QrCodeController extends GetxController {
  Future scanQrCode() async {
    try {
      String qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#FF6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      if (qrCode != "-1") {
        Get.to(() => ScanResultScren(data: qrCode));
      }
    } on PlatformException {
      log("Fail to load data");
    }
  }
}
