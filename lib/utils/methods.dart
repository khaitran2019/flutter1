import 'package:flashcard1/notifiers/flash_cards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/flash_cards_page.dart';

loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FlashCardsPage()));
  Provider.of<FlashCardsNotifier>(context, listen: false).setTopic(topic: topic);
}