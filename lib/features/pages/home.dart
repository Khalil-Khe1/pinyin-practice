import 'package:flutter/material.dart';

import 'package:pinyin_quiz/features/pages/button.dart';
import 'package:pinyin_quiz/features/pages/dialog_box.dart';
import 'package:pinyin_quiz/features/pages/practice.dart';

const BACKGROUND_COLOR = Color(0xFF1E2124);

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DefaultButton(
              label: 'Start Practice',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PracticePage()));
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}