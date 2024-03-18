import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'result_screen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;

  get closeScreen => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR SCANNER",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Place the QR code in the area",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scanning will be started automatically",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (barcode) {
                  if (!isScanCompleted) {
                    String code = barcode.raw ?? '---';
                    isScanCompleted = true; // Corrected assignment
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResultScreen(
                      closeScreen: closeScreen,
                      code: code, )));
                  }
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Developed by Fuu Chan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
