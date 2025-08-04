import 'package:flutter/material.dart';

class CarouselDisplay extends StatefulWidget {
  const CarouselDisplay({
    super.key,
    required this.strippedPinyin,
    required this.words
  });

  final List<List<String>> words;
  final String strippedPinyin;

  @override
  State<StatefulWidget> createState() => _CarouselDisplayState();
}

class _CarouselDisplayState extends State<CarouselDisplay> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.strippedPinyin),
      ),
      body: Column(
        children: [
          Expanded(
              child: CarouselView(
                itemSnapping: true,
                itemExtent: 800,
                children: widget.words.map((item) => Card(
                  child: Center(child: Text(item[0], style: TextStyle(fontSize: 72),)),
                )).toList()
              )
          ),
          Text('Trot')
        ],
      )
    );
  }
}