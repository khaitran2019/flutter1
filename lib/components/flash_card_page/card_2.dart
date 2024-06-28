
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

        child: HaftFlipAnimation(
          animate: notifier.flipCard2,
          reset: false,
          flipFromHaftWay: true,
          animationCompleted: () {
            print("Ani flip 2 completed");
          },
          child: SlideAnimation(
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                  width: size.width* 0.9,
                  height: size.height*0.7,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor
                  ),
                  child: Text("Hello")),
            ),
          ),
        ),
      ),
    );
  }
}