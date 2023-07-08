import 'package:flutter/material.dart';
import 'Homepage_news_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Intro.dart';
// ignore_for_file: prefer_const_constructors

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;

  if (isFirstTime) {
    await prefs.setBool(boolKey, false);
  }

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget{
  final bool isFirstTime;
  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: isFirstTime ? AppStart() : Homepage(),
    );
  }

}
class AppStart extends StatefulWidget {
  @override
  _AppStartState createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  Future<bool> hasVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasVisited = prefs.getBool('notVisited') ?? true;
    return hasVisited;
  }

  void notVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notVisited', false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: hasVisited(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return Intro(
            visited: () {
              notVisited();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
          );
        } else {
          return Homepage();
        }
      },
    );
  }
}
