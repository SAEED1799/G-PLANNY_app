import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:todoapp/view/screens/costs.dart';
import 'package:todoapp/view/screens/schedule.dart';

class SearchController extends GetxController {
  Barcode? result;
  TextEditingController searchTextController = TextEditingController();
  String search_text = "";
  void onQRViewCreated(QRViewController controller) {
    // this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code == "") {
        result = scanData;
      } else {
        result = scanData;
        controller.stopCamera();
        Get.back();
      }
    });
  }

  updateText(String search) {
    search_text = search;
    result = null;
    update();
  }

  bool usedSearch(String name) {
    return (result == null && search_text == "") ||
        name == result?.code ||
        (search_text != "" && name.contains(search_text));
  }
}
