import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'technology_news.dart';
import 'science_news.dart';
import 'business_news.dart';
import 'health_news.dart';
import 'sports_news.dart';
import 'entertainment_news.dart';
import 'general_news.dart';
import 'article_model.dart';
import 'fetch_general_news.dart';
// ignore_for_file: prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  //({Key key, this.title}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}
/*
List<dynamic> items=[]

void fetchedGeneralnewsItems().async{
  print('fetch started');
  const lodingurl= "";
  final url=Uri.parse(loadingurl);
  }
*/



class _HomepageState extends State<Homepage> {

  int bottomSelectedIndex=0;

  List<BottomNavigationBarItem> buildBottomNavBarItems(){
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'General',
          backgroundColor:Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.sports_baseball),
          label: 'Sports',
          backgroundColor: Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.business_center),
          label: 'Business',
          backgroundColor: Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.theater_comedy),
          label: 'Entertainment',
          backgroundColor: Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Health',
          backgroundColor: Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.science_outlined),
          label: 'Science',
          backgroundColor: Colors.green
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.phone_android),
          label: 'Technology',
          backgroundColor: Colors.green
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        General(),
        sport(),
        business(),
        entertainment(),
        health(),
        science(),
        technology(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
    bottomSelectedIndex = index;
    });
  }
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  //List<Articlemodel> arr=new List<Articlemodel>();
  //List<Articlemodel> arr=[];

  /*
  //late List<Articlemodel> articles=new List<Articlemodel>();
  late List<Articlemodel> articles = List<Articlemodel>.empty();
  bool _loading=true;

  getGeneralNews() async{
    news nss=news();
    await nss.get_generalNews();
    articles=nss.ns;
    setState(() {
      _loading=false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('General News'),
      ),
      body:
      //  General(),
        buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomSelectedIndex,
            onTap: (index) {
              bottomTapped(index);
            },
            items: buildBottomNavBarItems()
        ),
    );
  }
}

