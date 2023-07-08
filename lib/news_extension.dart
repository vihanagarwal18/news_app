import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'technology_news.dart';
import 'science_news.dart';
import 'business_news.dart';
import 'health_news.dart';
import 'sports_news.dart';
import 'entertainment_news.dart';
//import 'general_news.dart';
//import 'article_model.dart';
import 'Homepage_news_app.dart';
//import 'fetch_general_news.dart';
import 'dart:convert';
// ignore_for_file: prefer_const_constructors
class AdditionalInfo extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;

  const AdditionalInfo({required this.title, required this.author, required this.description, required this.content,required this.urlToImage,required this.publshedAt});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFE5E3E0),
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Color(0xFF111929),
          title: Text(title,
            style: TextStyle(
            color: Color(0xFFE5E3E0),
            fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\nWritten by ${author}\n',
                style: TextStyle(
                  color:Color(0xFF111929),
                  fontSize: 20,
                  //fontWeight: 20,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Image.network(
                  urlToImage,
                  height: (height / 6 - 20)*1.8,
                  width: width * 0.9,
                  //height:500,
                  //width: 400,
                ),
              ),
              Text(
                  '\n${content}\n',
                style: TextStyle(
                  color: Color(0xFF111929),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
