import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              code == ''
                  ? Text('')
                  : BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: '$code',
                      width: 200,
                      height: 200,
                    ),
              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Input Here',
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 47, 100, 91), width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  setState(() {
                    code = title.text;
                  });
                },
                child: Text(
                  "Generate QR Code",
                  style: TextStyle(
                    color: Color.fromARGB(255, 47, 100, 91),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
