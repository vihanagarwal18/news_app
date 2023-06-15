import 'package:flutter/material.dart';
import 'Homepage_news_app.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: Homepage()
    );
  }
}
