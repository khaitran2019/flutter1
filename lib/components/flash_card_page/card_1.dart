
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/haft_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../enum/slide_direction.dart';
import '../../notifiers/flash_cards_notifier.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<FlashCardsNotifier>(
      builder: (_,notifier, __ ) => GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCard1();
        },
        child: HaftFlipAnimation(
          animate: notifier.flipCard1,
          reset: false,
          flipFromHaftWay: false,
          animationCompleted: () {
            print("Ani flip 1 completed");
            notifier.runFlipCard2();
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