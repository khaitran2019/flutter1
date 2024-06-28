import 'dart:math';

import 'package:flutter/material.dart';

class HaftFlipAnimation extends StatefulWidget {
  const HaftFlipAnimation(
      {super.key, required this.child, required this.animate, required this.reset, required this.flipFromHaftWay, required this.animationCompleted,
      });

  final Widget child;
  final bool animate;
  final bool reset;
  final bool flipFromHaftWay;
  final VoidCallback animationCompleted;

  @override
  State<HaftFlipAnimation> createState() => _HaftFlipAnimationState();
}

class _HaftFlipAnimationState extends State<HaftFlipAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this)..addListener((){
          if(_animationController.isCompleted){
            widget.animationCompleted.call();
          }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HaftFlipAnimation oldWidget) {

    if(widget.reset){
      _animationController.reset();
    }

    if(widget.animate){
      _animationController.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double rotateAdjustment = 0;

    if(widget.flipFromHaftWay){
      rotateAdjustment = pi / 2;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY((_animationController.value* pi)/2)
        ..rotateY(rotateAdjustment),
        child: widget.child,),
    );
  }
}
