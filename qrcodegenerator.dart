// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcodegenerator extends StatefulWidget {
  const Qrcodegenerator({super.key});

  @override
  State<Qrcodegenerator> createState() => _QrcodegeneratorState();
}

class _QrcodegeneratorState extends State<Qrcodegenerator> {
  TextEditingController sajawalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Generate QR Code",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/image1.png"), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (sajawalController.text.isNotEmpty)
                  QrImageView(data: sajawalController.text, size: 200),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: sajawalController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Link,Text, Phone number etc",
                      hintStyle: TextStyle(fontSize: 12, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Enter your data",
                      labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Generate",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
