import 'package:flutter/material.dart';
import 'package:qr/widgets/qr_scanner.dart';

class ScanCode extends StatefulWidget {
  @override
  _ScanCodeState createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 300,
                height: 300,
                child: QRScanner())
          ],
        ),
      ),
    );
  }
}
