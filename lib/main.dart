import 'package:flutter/material.dart';
import 'package:youtube_app/view/screen/home_page.dart';
import 'package:youtube_app/view/screen/player_page.dart';
import 'package:youtube_app/view/screen/search_page.dart';

void  main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>   Home_Page(),
        'search_page': (context) =>  Search_Page(),
        "player_page": (context) =>  PlayerPage(), // youtube_page
      },
    )
  );
}