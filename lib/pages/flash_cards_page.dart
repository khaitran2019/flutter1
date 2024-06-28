import 'package:flashcard1/animations/haft_flip_animation.dart';
import 'package:flashcard1/animations/slide_animation.dart';
import 'package:flashcard1/enum/slide_direction.dart';
import 'package:flashcard1/notifiers/flash_cards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app/custom_appbar.dart';
import '../components/flash_card_page/card_1.dart';
import '../components/flash_card_page/card_2.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({super.key});

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FlashCardsNotifier>(context, listen: false).runSlideCard1();
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<FlashCardsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: CustomAppBar()),
        body: IgnorePointer(
          ignoring: notifier.ignoreTouches,
          child: Stack(
            children: [
              Card2(),
              Card1()],
              ),
        ),
      ),
    );
  }
}



