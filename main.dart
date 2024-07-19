// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qrcodegenertor/qrcodegenerator.dart';
import 'package:qrcodegenertor/qrcodescanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "QrcodeScanner",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Qr code",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/image.png"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Qrcodescanner()));
                    });
                  },
                  child: Text(
                    "Scan QR code",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 50,
                width: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Qrcodegenerator()));
                    });
                  },
                  child: Text(
                    "Generate QR code",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
