import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_extension.dart';
import 'technology_news.dart';
import 'science_news.dart';
import 'business_news.dart';
import 'health_news.dart';
//import 'sports_news.dart';
import 'entertainment_news.dart';
//import 'general_news.dart';
//import 'article_model.dart';
import 'Homepage_news_app.dart';
import 'dart:convert';
// ignore_for_file: prefer_const_constructors

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

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);
  @override
  State<General> createState() => _GeneralState();
}
/*
class _GeneralState extends State<General> {
  List<Articlemodel> article=[];
  @override
  void initState(){
    super.initState();
    get_generalNews();
  }
  Future<void> get_generalNews() async {
    print('fetching data started');
    //final List<Articlemodel> arrs=[];
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3bc376ffe7874e589d054ad1cd22a58e"));
    var jsonData = jsonDecode(response.body);
    final List<Articlemodel> aff=[];
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          final articlee = Articlemodel(
            title: element['title'].toString() ?? '',
            author: element['author'].toString() ?? '',
            description: element['description'].toString() ?? '',
            urlToImage: element['urlToImage'].toString() ?? '',
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"].toString() ?? '',
            articleUrl: element["url"].toString() ?? '',
          );
          print(articlee.title);
          //article.add(article);
          aff.add(articlee);
        }
      });
    }
    setState(() {
      article=aff;
    });
    print('fetching finished');
  }
  void navigateToAdditionalInfo(Articlemodel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdditionalInfo(title: article.title, author: article.author,description: article.description,content: article.content,urlToImage: article.urlToImage,publshedAt: article.publshedAt
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    //print(height);
    return SingleChildScrollView(
      //child: Column(
          child:
            Container(
              color: Color(0xFF626D7E),
              //color: Color(0xFF111929),
              height:height -(height*0.166666667) ,
              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  //itemCount:article.length,
                  itemCount:15,
                  itemBuilder: (BuildContext context,int index){
                    final news=article[index];
                    return InkWell(
                      onTap: (){
                        print("clicked for extension");
                        navigateToAdditionalInfo(news);
                      },
                      child: SingleChildScrollView(
                        child: Container(
                            margin:EdgeInsets.all(8) ,
                            //width:300,
                            //height:(height/6),
                            decoration: BoxDecoration(
                                color: Color(0xFF111929),
                              border: Border.all(
                                  color: Color(0xFFE5E3E0),
                                  width: 5,
                              )
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            //Wrap(
                              children: [
                                Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                        news.urlToImage,
                                        height:(height/6 - 20),
                                        width: width * 0.3,
                                    ),
                                  ],
                                ),
                                SizedBox(width:10),
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width - (width * 0.5),
                                        child: Text(
                                          news.title,
                                          style: TextStyle(
                                            color: Color(0xFFE5E3E0),
                                            //color: Colors.lime,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:20),
                                      if(news.author!='null')
                                        SizedBox(
                                          width:width*0.5,
                                          child: Text(
                                            'by ${news.author}',
                                            style: TextStyle(
                                              color: Color(0xFFE5E3E0),
                                              //color:Colors.lime,
                                              fontSize: 10,
                                              //fontWeight: 20,
                                            ),
                                          ),
                                        ),

                                      SizedBox(height: 20),
                                      SizedBox(
                                        width: width * 0.5,
                                        child: Text(
                                          news.description,
                                          style: TextStyle(
                                            color: Color(0xFFE5E3E0),
                                            //color: Colors.lime,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                    );
                  }
              ),
            ),
    );
  }
}
*/
class _GeneralState extends State<General> {
  late Future<List<Articlemodel>> futureArticles;

  @override
  void initState() {

    super.initState();
    futureArticles = getGeneralNews();



  }
  Future<List<Articlemodel>> getGeneralNews() async {
    print('fetching data started');
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3bc376ffe7874e589d054ad1cd22a58e"));
    var jsonData = jsonDecode(response.body);
    final List<Articlemodel> aff = [];
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          final articlee = Articlemodel(
            title: element['title'].toString() ?? '',
            author: element['author'].toString() ?? '',
            description: element['description'].toString() ?? '',
            urlToImage: element['urlToImage'].toString() ?? '',
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"].toString() ?? '',
            articleUrl: element["url"].toString() ?? '',
          );
          print(articlee.title);
          aff.add(articlee);
        }
      });
    }
    print('fetching finished');
    return aff;
  }

  void navigateToAdditionalInfo(Articlemodel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdditionalInfo(
          title: article.title,
          author: article.author,
          description: article.description,
          content: article.content,
          urlToImage: article.urlToImage,
          publshedAt: article.publshedAt,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder<List<Articlemodel>>(
      future: futureArticles,
      builder: (BuildContext context, AsyncSnapshot<List<Articlemodel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
            //child:LinearProgressIndicator(),// LinearProgressIndicator() for linear progress indicator
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Articlemodel> article = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              color: Color(0xFF626D7E),
              height: height - (height * 0.166666667),
              child: ListView.builder(
                itemCount: article.length,
                itemBuilder: (BuildContext context, int index) {
                  final news = article[index];
                  return InkWell(
                    onTap: () {
                      print("clicked for extension");
                      navigateToAdditionalInfo(news);
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF111929),
                          border: Border.all(
                            color: Color(0xFFE5E3E0),
                            width: 5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  news.urlToImage,
                                  height: (height / 6 - 20),
                                  width: width * 0.3,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width - (width * 0.5),
                                    child: Text(
                                      news.title,
                                      style: TextStyle(
                                        color: Color(0xFFE5E3E0),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  if (news.author != 'null')
                                    SizedBox(
                                      width: width * 0.5,
                                      child: Text(
                                        'by ${news.author}',
                                        style: TextStyle(
                                          color: Color(0xFFE5E3E0),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: width * 0.5,
                                    child: Text(
                                      news.description,
                                      style: TextStyle(
                                        color: Color(0xFFE5E3E0),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
