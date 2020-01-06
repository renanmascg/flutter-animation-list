import 'package:flutter/material.dart';
import 'package:simple_animation/fade_in_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FadeInUi(),
          ),
        ),
      ),
    );
  }
}