// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:get/get.dart';

// class BarcodeController extends GetxController {
//   RxString scanBarcode = 'Unknown'.obs;

//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         '#C60C30',
//         'Ok',
//         true,
//         ScanMode.BARCODE,
//       );
//       print(barcodeScanRes);
//       scanBarcode.value = barcodeScanRes;
//     } on PlatformException {
//       scanBarcode.value = 'Failed to get platform version.';
//     }
//   }

//   void startBarcodeScanStream() {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//       '#ff6666',
//       'Ok',
//       true,
//       ScanMode.BARCODE,
//     )!
//         .listen((barcode) => print(barcode));
//   }

// Future<void> scanQR() async {
//   try {
//     String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666', 'Cancel', true, ScanMode.QR);
//     print(barcodeScanRes);
//     scanBarcode.value = barcodeScanRes;
//   } on PlatformException {
//     scanBarcode.value = 'Failed to get platform version.';
//   }
// }
// void showSnackBar(BuildContext context, String message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(message),
//     ),
//   );
// }
// }

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:get/get.dart';

// class BarcodeController extends GetxController {
//   RxList<String> scannedBarcodes = <String>[].obs;
//   final assetsAudioPlayer = AssetsAudioPlayer();

//   Future<void> scanBarcode() async {
//     try {
//       String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         '#C60C30',
//         'Ok',
//         true,
//         ScanMode.BARCODE,
//       );

//       if (barcodeScanRes != '-1') {
//         scannedBarcodes.add(barcodeScanRes);
//         assetsAudioPlayer.open(
//           Audio("assets/red.wav"),
//         );
//         scanBarcode();
//       }
//     } on PlatformException {
//       Get.snackbar('Error', 'Failed to get platform version.');
//     }
//   }

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarcodeController extends GetxController {
  RxList<String> scannedBarcodes = <String>[].obs;
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  Future<String> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#C60C30',
        'Ok',
        true,
        ScanMode.BARCODE,
      );

      if (barcodeScanRes != '-1') {
        scannedBarcodes.add(barcodeScanRes);
        await assetsAudioPlayer.open(
          Audio("assets/Barcode scanner.m4a"),
        );
        return barcodeScanRes;
      } else {
        throw 'Scan cancelled';
      }
    } on PlatformException {
      throw 'Failed to get platform version.';
    } catch (e) {
      throw 'Failed to scan barcode.';
    }
  }
}







  // void clearScannedBarcodes() {
  //   scannedBarcodes.clear();
  // }

  // void printScannedBarcodes() {
  //   print(scannedBarcodes);
  //   Get.snackbar('Scanned Barcodes', scannedBarcodes.join(', '));
  // }
