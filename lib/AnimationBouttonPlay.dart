import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'IconContent.dart';

class AnimationBouttonPlay extends StatefulWidget {
  final Widget boutonEnfant;

  const AnimationBouttonPlay({  @required this.boutonEnfant}) ;

  @override
  _AnimationBouttonPlayState createState() => _AnimationBouttonPlayState();
}

class _AnimationBouttonPlayState extends State<AnimationBouttonPlay>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();


  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /*animate() {
    if (!estOuvert) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    estOuvert = !estOuvert;
  }*/

  @override
  Widget build(BuildContext context) {
    AnimationBouttonPlay();
    return  InkWell(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: LiquidCircularProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          center: Container(
            child: widget.boutonEnfant ,
          ),
        ),
      ),

    );

  }
}

