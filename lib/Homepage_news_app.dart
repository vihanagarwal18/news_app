import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'technology_news.dart';
import 'science_news.dart';
import 'business_news.dart';
import 'health_news.dart';
import 'sports_news.dart';
import 'entertainment_news.dart';
import 'general_news.dart';
//import 'article_model.dart';
//import 'fetch_general_news.dart';
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
/*
class _HomepageState extends State<Homepage>{
  int _selectedIndex=0;
  List<Widget> _widgetOptions=<Widget>[
    General(),
    sport(),
    business(),
    entertainment(),
    health(),
    science(),
    technology(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App by Vihan'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

 */



class _HomepageState extends State<Homepage> {
  int bottomSelectedIndex=0;
  List<BottomNavigationBarItem> buildBottomNavBarItems(){
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'General',
          backgroundColor:Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.sports_baseball),
          label: 'Sports',
          backgroundColor: Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.business_center),
          label: 'Business',
          backgroundColor: Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.theater_comedy),
          label: 'Entertainment',
          backgroundColor: Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Health',
          backgroundColor: Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.science_outlined),
          label: 'Science',
          backgroundColor: Color(0xFF515A69),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.phone_android),
          label: 'Technology',
          backgroundColor: Color(0xFF515A69),
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
    print(4);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111929),
      appBar: AppBar(
        title: Text('News App created by Vihan'),
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
