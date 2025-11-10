import 'package:flutter/material.dart';
import 'package:instagram/screen/bottom_navigation_screen/home_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/post_add_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/profile_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/reels_screen.dart';
import 'package:instagram/screen/bottom_navigation_screen/search_screen.dart';
import 'package:instagram/screen/dashboard/dashboard_screen.dart';
import 'package:instagram/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: SplashScreen(),
    );
  }
}
