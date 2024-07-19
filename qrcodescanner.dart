// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Qrcodescanner extends StatefulWidget {
  const Qrcodescanner({super.key});

  @override
  State<Qrcodescanner> createState() => _QrcodescannerState();
}

class _QrcodescannerState extends State<Qrcodescanner> {
  String qrcodedata = "Scan data";
  Future<void> scanQR() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', "Cancel", true, ScanMode.QR);
      if (!mounted) return;
      if (qrcode == '-1') {
        // Handle the case when the scan is canceled
        setState(() {
          qrcodedata = "Scan canceled";
        });
      } else {
        // Handle successful scan
        setState(() {
          qrcodedata = qrcode; // Assign scanned QR code data
        });
      }
    } on PlatformException {
      qrcodedata = "Fail to Scan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Scan QR Code",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/image.png",
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "$qrcodedata",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    scanQR();
                  },
                  child: Text(
                    "Scan",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
