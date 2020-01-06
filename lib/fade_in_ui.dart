import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_animation/animated_bubble.dart';

class FadeInUi extends StatefulWidget {
  @override
  _FadeInUiState createState() => _FadeInUiState();
}

class _FadeInUiState extends State<FadeInUi> {
  bool isVisible = true;
  ScrollController _controller = ScrollController();

  List<dynamic> _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11].map((item) {
    return AnimatedBubble(fadeInDelay: 0);
  }).toList();

  void addList() async {
    
    _list.add(AnimatedBubble(fadeInDelay: 1));

    Timer(Duration(milliseconds: 100), () {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });

    Timer(Duration(milliseconds: 2300), () {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _list.length,
            controller: _controller,
            itemBuilder: (context, index) {
              return _list[index];
            },
          ),
        ),
        RaisedButton(
          color: Colors.blue,
          onPressed: () {
            for (int i = 0; i < 3; i++) {
              Timer(Duration(seconds: 2 * i), () async {
                setState(() {
                  print(_list.length);
                  
                  addList();
                });
              });
            }
          },
        )
      ],
    );
  }
}
