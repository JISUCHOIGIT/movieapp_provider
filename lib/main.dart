import 'package:flutter/material.dart';
import 'package:movieapp_provider/src/home.dart';
import 'package:movieapp_provider/src/provider/bottom_navigation_provider.dart';
import 'package:movieapp_provider/src/provider/count_provider.dart';
import 'package:movieapp_provider/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountProvider()),
          ChangeNotifierProvider(
              create: (context) => BottomNavigationProvider()),
          ChangeNotifierProvider(
              create: (context) => MovieProvider())
        ],
        child: Home(),
      ),
    );
  }
}
