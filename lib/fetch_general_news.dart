import 'package:flutter/material.dart';
//import 'article_model.dart';
import 'general_news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {

  // List<Articlemodel> article=[];
  // @override
  // void initstate(){
  //   super.initState();
  //   get_generalNews();
  // }
  // Future<void> get_generalNews() async {
  //   print('fetching data started');
  //   //final List<Articlemodel> arrs=[];
  //   var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3bc376ffe7874e589d054ad1cd22a58e"));
  //   var jsonData = jsonDecode(response.body);
  //   final List<Articlemodel> aff=[];
  //   if (jsonData['status'] == "ok") {
  //     jsonData["articles"].forEach((element) {
  //       if (element['urlToImage'] != null && element['description'] != null) {
  //         final article = Articlemodel(
  //           title: element['title'],
  //           author: element['author'],
  //           description: element['description'],
  //           urlToImage: element['urlToImage'],
  //           publshedAt: DateTime.parse(element['publishedAt']),
  //           content: element["content"],
  //           articleUrl: element["url"],
  //         );
  //         //article.add(article);
  //         aff.add(article);
  //       }
  //     });
  //   }
  //   setState(() {
  //     article=aff;
  //   });
  //   print('fetching finished');
  // }
  // void navigatetogeneralnewspage(Articlemodel article){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => GeneralnewsPage(article:article),
  //     ),
  //   );
  // }
  Widget build(BuildContext context){
    return Container();
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.red,
  //     body: SingleChildScrollView(
  //       child:
  //     ),
  //   );
  // }
}

class  GeneralnewsPage extends StatelessWidget {
  //const  GeneralnewsPage({Key? key}) : super(key: key);
  final Articlemodel article;

  GeneralnewsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
            ),
            Text('by ${article.author}'),
            SizedBox(height: 10),
            Text(article.description),
            SizedBox(height: 10),
          ],
        )
      ),
    );
  }
}

