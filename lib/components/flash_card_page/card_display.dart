import 'package:flashcard1/notifiers/flash_cards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    super.key,
    required this.isCard1,
  });

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardsNotifier>(
      builder: (_, notifier, __) => isCard1
          ? Column(
              children: [
                buildImage(notifier.word1.english),
                buildTextBox(notifier.word1.english, context, 1),
              ],
            )
          : Column(
              children: [
                buildImage(notifier.word2.english),
                buildTextBox(notifier.word2.character, context, 2),
                buildTextBox(notifier.word2.ipa, context, 1),
              ],
            ),
    );
  }

  Expanded buildTextBox(String text, BuildContext context, int flex) {
    return Expanded(
      flex: flex,
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
    ));
  }

  Expanded buildImage(String image) {
    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset('assets/images/words/${image.toLowerCase()}.png'),
        ));
  }
}
