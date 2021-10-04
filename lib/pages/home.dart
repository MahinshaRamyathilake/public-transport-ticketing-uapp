import 'package:flutter/material.dart';
import 'package:sl_mate/components/main_drawer.dart';
import 'package:sl_mate/pages/qr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("My QR"),
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new QrPage(
                ))))
          ],
        ),
      ),
    );
  }
}


