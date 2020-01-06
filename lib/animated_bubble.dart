import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation/fade_in.dart';
import 'package:simple_animation/jumping_dots.dart';

class AnimatedBubble extends StatefulWidget {

  final double fadeInDelay;

  AnimatedBubble({ this.fadeInDelay });

  @override
  _AnimatedBubbleState createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<AnimatedBubble> {

  bool isJDVisible = true;

  @override
  void initState() {
    super.initState();

    if(widget.fadeInDelay == 0) {
      print('entrou aqui');
      isJDVisible = false;
    } else {
      Timer(Duration(seconds: 2), () {
        setState(() {
          isJDVisible = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isJDVisible ? Container(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              makeJumpingDots(0, 400),
              makeJumpingDots(200, 200),
              makeJumpingDots(400, 0),
            ],
          ),
        ],
      ),
    ) :
    FadeIn(widget.fadeInDelay, Card(child: ListTile()));
  }
}