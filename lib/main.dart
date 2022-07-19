import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/ui_components/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xff1C2031),
  ));
  runApp(MaterialApp(
      title: "UI TEST",
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
      }
  ));
}