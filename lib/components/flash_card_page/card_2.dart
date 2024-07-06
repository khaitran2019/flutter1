
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/haft_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../enum/slide_direction.dart';
import '../../notifiers/flash_cards_notifier.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<FlashCardsNotifier>(
      builder: (_,notifier, __ ) => GestureDetector(
        onHorizontalDragEnd: (details){
          if(details.primaryVelocity! > 100){
            notifier.setIgnoreTouches(ignore: true);
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.generateCurrentWord();
          }

          if(details.primaryVelocity! < -100){
            notifier.setIgnoreTouches(ignore: true);
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.generateCurrentWord();
          }
        },
        child: HaftFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHaftWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouches(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: (){
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipeDirection,
            child: Center(
              child: Container(
                  width: size.width* 0.9,
                  height: size.height*0.7,
                  decoration: BoxDecoration(
                      color: Colors.pink
                  ),
                  child: FlippedText(text: notifier.word2.character)),
            ),
          ),
        ),
      ),
    );
  }
}

class FlippedText extends StatelessWidget {
  final String text;

  const FlippedText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}