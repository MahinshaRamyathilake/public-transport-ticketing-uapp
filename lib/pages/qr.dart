import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sl_mate/components/main_drawer.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      //drawer: MainDrawer(),
      body: Center(
        child: QrImage(
          data: "Menuka",
          version: QrVersions.auto,
          size: 300,
        ),
      ),
    );
  }
}
