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
import 'fetch_general_news.dart';
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
  void navigatetogeneralnewspage(Articlemodel article){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneralnewsPage(article:article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              height:800,
              child: ListView.builder(
                  //itemCount:article.length,
                  itemCount:10,
                  itemBuilder: (BuildContext context,int index){
                    final news=article[index];
                    return Container(
                        margin:EdgeInsets.all(8) ,
                        width:200,
                        height:100,
                        child:  SingleChildScrollView(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                        news.urlToImage,
                                        height:100,
                                        width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          news.title,
                                        ),
                                        Text('by ${news.author}'),
                                        SizedBox(height: 10),
                                        //Row(children: [Expanded(child: Text(news.description, softWrap: false, maxLines: 1),),],),
                                        //SizedBox(child:Text(news.description),height: 20,width:MediaQuery.of(context).size.width-10),
                                        //Expanded(child: Text(news.description,softWrap: false,maxLines: 1,)),
                                        //Expanded(child: Text(news.description)),
                                        // Flexible(
                                        //       child: Text(news.description)),
                                        Text(news.description),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                      );
                  }
              ),
            ),
            Container(
              //   width:200,
              height:200,
              color: Colors.red,
              child: Row(
                  children: [
                    Image.asset(
                      'asset/ajetak.png',
                      height: 200,
                      width: 100,
                    ),
                    Text("Aje Tak News",
                      style:TextStyle(color: Colors.yellowAccent,fontWeight:FontWeight.w600,fontSize: 18),
                    ),
                  ]
              ),
            ),
            Container(
              //    width:200,
              height:200,
              color: Colors.red,
              child: Row(
                  children: [
                    Image.asset(
                      'asset/cnbc_awaaz.jpg',
                      height: 200,
                      width: 100,
                    ),
                    Text("CNBC Awaaz",
                      style:TextStyle(color: Colors.yellowAccent,fontWeight:FontWeight.w600,fontSize: 18),
                    ),
                  ]
              ),
            ),
            Container(
              //  width:200,
              height:200,
              color: Colors.red,
              child: Row(
                  children: [
                    Image.asset(
                      'asset/ndtv.png',
                      height: 200,
                      width: 100,
                    ),
                    Text("NDTV News",
                      style:TextStyle(color: Colors.yellowAccent,fontWeight:FontWeight.w600,fontSize: 18),
                    ),
                  ]
              ),
            ),
            Container(
              //  width:200,
              height:200,
              color: Colors.red,
              child: Row(
                  children: [
                    Image.asset(
                      'asset/times_now.jpg',
                      height: 200,
                      width: 100,
                    ),
                    Text("Times Now News",
                      style:TextStyle(color: Colors.yellowAccent,fontWeight:FontWeight.w600,fontSize: 18),
                    ),
                  ]
              ),
            ),
            Container(
              //  width:200,
              height:200,
              color: Colors.red,
              child: Row(
                  children: [
                    Image.asset(
                      'asset/zeenews.png',
                      height: 200,
                      width: 100,
                    ),
                    Text("Zee News",
                      style:TextStyle(color: Colors.yellowAccent,fontWeight:FontWeight.w600,fontSize: 18),
                    ),
                  ]
              ),
            ),
          ]
      ),
    );
  }
}
