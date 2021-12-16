import 'package:flutter/material.dart';
import 'package:qr/widgets/qr_generator.dart';

class GenerateCode extends StatefulWidget {
  @override
  _GenerateCodeState createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [QRGenerator(message: 'Test message')],
        ),
      ),
    );
  }
}
