import 'package:flutter/material.dart';

class Cards {

  String? title;
  String? subtitle;
  String? icon1;
  String? icon2;
  String? theme;
  Color? color;

  Cards({this.title, this.subtitle, this.icon1, this.icon2, this.theme})
  {
    if(theme == 'blue') {
      color = const Color(0xff4E81EB);
    }
    else if(theme == 'pink') {
      color = const Color(0xffFC67A7);
    }
    else if(theme == 'red') {
      color = const Color(0xff06B782);
    }
    else {
      color = const Color(0xffFFD541);
    }
  }
}