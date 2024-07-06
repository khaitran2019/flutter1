import 'dart:math';

import 'package:flashcard1/configs/constants.dart';
import 'package:flashcard1/data/words.dart';
import 'package:flashcard1/enum/slide_direction.dart';
import 'package:flashcard1/models/word.dart';
import 'package:flutter/material.dart';

class FlashCardsNotifier extends ChangeNotifier{
  String topic = "";

  bool slideCard1 = false;
  bool flipCard1 = false;

  bool flipCard2 = false;
  bool swipeCard2 = false;

  bool resetSlideCard1 = false;
  bool resetFlipCard1 = false;

  bool resetFlipCard2 = false;
  bool resetSwipeCard2 = false;

  bool ignoreTouches = true;

  SlideDirection swipeDirection = SlideDirection.none;

  Word word1 = Word(topic: "topic", english: "english", character: "character", ipa: "ipa");
  Word word2 = Word(topic: "topic", english: "english", character: "character", ipa: "ipa");

  List<Word> selectedWords = [];

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == this.topic).toList();
  }

  generateCurrentWord(){
    if(selectedWords.isEmpty){
      // generateAllSelectedWords();
      print("All words are selected");
    } else {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }

    Future.delayed(Duration(milliseconds: kSlideAwayDuration), (){
      word2 = word1;
    });
  }

  setIgnoreTouches({required bool ignore}){
    ignoreTouches = ignore;
    notifyListeners();
  }

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  runSlideCard1(){
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1(){
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  runFlipCard2(){
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}){
    swipeDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCard1(){
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  resetCard2(){
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
  }
}