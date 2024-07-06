import 'package:flashcard1/animations/fade_in_animation.dart';
import 'package:flashcard1/configs/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/methods.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required this.topic,
  });

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: (){
          loadSession(context: context, topic: topic);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderCir),
            color: Theme.of(context).primaryColor,
            // border: Border.all(
            //   color: Colors.white,
            //   width: kCardBorderWidth,
            // )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: topic,
                        child: Image.asset('assets/images/${topic.toLowerCase()}.png')),
                  ))
              ,
              Expanded(child: Text(topic)),
            ],
          ),
        ),
      ),
    );
  }
}