import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:todoapp/controllers/search_controller.dart';
import 'package:todoapp/view/screens/schedule.dart';

class QRViewE extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) => QRView(
          // overlayMargin: const EdgeInsets.all(30),
          overlay: QrScannerOverlayShape(
            borderColor: Colors.green,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutBottomOffset: MediaQuery.of(context).size.width * 0.2,
          ),
          key: qrKey,
          onQRViewCreated: controller.onQRViewCreated,
        ),
      ),
    );
  }
}
