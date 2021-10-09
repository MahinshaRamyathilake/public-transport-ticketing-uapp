import 'package:flutter/material.dart';
import 'package:sl_mate/pages/home.dart';
import 'package:sl_mate/pages/login.dart';


void main() {
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage()
      )
  );
}