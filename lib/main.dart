import 'package:flutter/material.dart';
import 'package:youtube_app/view/screen/home_page.dart';
import 'package:youtube_app/view/screen/player_page.dart';
import 'package:youtube_app/view/screen/search_page.dart';
import 'package:youtube_app/view/screen/splash_screen.dart';

void  main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode:ThemeMode.system,
      routes: {
        '/': (context) => const Splash_screen(),
        'home_page': (context) => Home_Page(),
        'search_page': (context) =>  const Search_Page(),
        "player_page": (context) =>  const PlayerPage(), // youtube_page
      },
    )
  );
}