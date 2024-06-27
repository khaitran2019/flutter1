import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({super.key, required this.child});

  final Widget child;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation, _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

    super.initState();

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine)
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine)
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(_scaleAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}

