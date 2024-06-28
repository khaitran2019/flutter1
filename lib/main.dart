import 'package:flashcard1/configs/themes.dart';
import 'package:flashcard1/notifiers/flash_cards_notifier.dart';
import 'package:flashcard1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => FlashCardsNotifier())
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcards',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
