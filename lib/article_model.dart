//3bc376ffe7874e589d054ad1cd22a58e
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Articlemodel {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;
  //int count=0;
  Articlemodel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publshedAt,
      required this.urlToImage,
      required this.articleUrl});
  //Articlemodel({this.title='',this.description='',this.author='',this.content='',this.urlToImage='', this.articleUrl=''});
}

// class news {
//   List<Articlemodel> ns = [];
//
// }
