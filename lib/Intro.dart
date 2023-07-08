import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Homepage_news_app.dart';

class Intro extends StatefulWidget {
  final VoidCallback visited;

  const Intro({Key? key, required this.visited}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
              'this is your first time opening this app\nMade by Vihan Agarwal'),
          GestureDetector(
            onTap: () {
              print(3);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            child: Icon(Icons.arrow_forward),

          )
        ],
      ),
    );
  }
}
