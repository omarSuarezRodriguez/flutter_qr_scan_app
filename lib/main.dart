import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: qrCode(),
    ));

class qrCode extends StatefulWidget {
  const qrCode({super.key});

  @override
  State<qrCode> createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  String _data = '';

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: Text('Scan Barcode'),
            onPressed: () {
              _scan();
            },
          ),
          Text(_data),
        ],
      ),
    );
  }
}
