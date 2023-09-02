import 'package:flutter/material.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';

void main() {
  runApp(PrinterApp());
}

class PrinterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Printer App',
      home: PrinterPage(),
    );
  }
}

class PrinterPage extends StatelessWidget {
  final profile = NetworkPrinter(PaperSize.mm80);

  Future<void> _printName(String name, int fontSize) async {
    final printer = await profile.connect();
    printer.text(name,
        styles: PosStyles(align: PosAlign.center, height: PosTextSize.size2));
    await printer.cut();
    printer.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POS Printer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  _printName('Chidiebere Chukwuma', 1), // Small font
              child: Text('Print Small'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _printName('Chidiebere Chukwuma', 2), // Medium font
              child: Text('Print Medium'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _printName('Chidiebere Chukwuma', 3), // Large font
              child: Text('Print Large'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _printName('Chidiebere Chukwuma', 4), // Extra Large font
              child: Text('Print Extra Large'),
            ),
          ],
        ),
      ),
    );
  }
}
