import 'package:flutter/material.dart';

import 'features/pages/home.dart' show HomePage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: new Scaffold(
        body: Center(
            child: new HomePage(title: 'Pinyin Practice')
        )
      )
    );
  }
}


