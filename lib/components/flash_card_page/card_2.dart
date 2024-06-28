
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
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            // notifier.resetCard2();
            notifier.runSlideCard1();
          }

          if(details.primaryVelocity! < -100){
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);

            notifier.runSlideCard1();
          }
        },
        child: HaftFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHaftWay: true,
          animationCompleted: () {
            print("Ani flip 2 completed");
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
                  child: Text("2222")),
            ),
          ),
        ),
      ),
    );
  }
}