import 'package:flutter/material.dart';
import 'package:pdp_ui_instagram/pages/feed_page.dart';
import 'package:pdp_ui_instagram/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
        FeedPage.id : (context) => FeedPage(),
      },
    );
  }
}