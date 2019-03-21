import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'lib.random_color/color_info.dart';
import 'lib.random_color/name_that_color.dart';
import 'lib.random_color/random_color.dart';

main() => runApp(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          child: Counter(),
        ),
      ),
    );

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  RandomColor _randomColor = RandomColor();
  final Random _random = Random();
  Color _color = Color(0xFFFFFFFF);

  Color _colorBox = Color(0x884422FF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ++_counter;

            _color = Color.fromARGB(
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextInt(256),
            );

            _colorBox = _randomColor.randomColor();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _color,
          ),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hey there!',
                    textScaleFactor: 3,
                    style: TextStyle(color: _colorBox),
                  ),
                  Text(
                    'count tap - $_counter',
                    textScaleFactor: 2,
                    style: TextStyle(color: _colorBox),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
