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

  static const String scanCancelled = '-1';
  static const String audioFilePath = "assets/Barcode scanner.m4a";
  static const String scanColor = '#C60C30';
  static const String scanButtonText = 'Cancel';

  Future<String?> scanBarcode() async {
    try {
      // Initiate barcode scanning
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        scanColor,
        scanButtonText,
        true,
        ScanMode.BARCODE,
      );

      if (barcodeScanRes != scanCancelled) {
        scannedBarcodes.add(barcodeScanRes);
        await assetsAudioPlayer.open(
          Audio(audioFilePath),
        );
        return barcodeScanRes;
      } else {
        return null;
      }
    } on PlatformException {
      return Future.error('Failed to get platform version.');
    } catch (e) {
      return Future.error('Failed to scan barcode.');
    }
  }

  @override
  void onClose() {
    assetsAudioPlayer.dispose();
    super.onClose();
  }
}




  // void clearScannedBarcodes() {
  //   scannedBarcodes.clear();
  // }

  // void printScannedBarcodes() {
  //   print(scannedBarcodes);
  //   Get.snackbar('Scanned Barcodes', scannedBarcodes.join(', '));
  // }
