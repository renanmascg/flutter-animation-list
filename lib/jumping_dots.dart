import 'package:flutter/material.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

Widget makeJumpingDots(int before, int after) {
  return AnimatorSet(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      width: 10,
      height: 15,
      margin: EdgeInsets.all(2),
    ),
    animatorSet: [
      Delay(duration: before),
      TY(from: 10, to: 0, duration: 200, delay: 0, curve: Curves.linear),
      TY(from: -10, to: 0, duration: 200, delay: 0, curve: Curves.linear),
      Delay(duration: after)
    ],
  );
}