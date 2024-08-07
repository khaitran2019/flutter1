
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/haft_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../configs/constants.dart';
import '../../enum/slide_direction.dart';
import '../../notifiers/flash_cards_notifier.dart';
import 'card_display.dart';

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
          notifier.setIgnoreTouches(ignore: true);
        },
        child: HaftFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHaftWay: false,
          animationCompleted: () {
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            aniDuration: 500,
            aniDelay: 200,
            animationCompleted: (){
              notifier.setIgnoreTouches(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                  width: size.width* 0.9,
                  height: size.height*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderCir),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(
                        color: Colors.white,
                        width: kCardBorderWidth,
                      )
                  ),
                  child: CardDisplay(isCard1: true,)),
            ),
          ),
        ),
      ),
    );
  }
}

