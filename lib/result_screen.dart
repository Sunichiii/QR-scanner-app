import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/qr_scanner.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            closeScreen();
            Navigator.pop(context);
          },icon: (
            Icon(
                Icons.arrow_back_ios_new_rounded,
            color: Colors.black,)),),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Scanned Result:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // This is where the QR code will be displayed
            QrImageView(
              data: code,
              version: QrVersions.auto,
              size: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Scan Result",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              "$code",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color
                ),
                onPressed: () {
                  // Handle button press
                },
                child: const Text(
                  "COPY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
