import 'package:flashcard1/animations/fade_in_animation.dart';
import 'package:flashcard1/data/words.dart';
import 'package:flutter/material.dart';

import '../components/home_page/topic_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _topics = [];

  @override
  void initState() {

    for(var t in words){
      if(!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
    }
    _topics.sort();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: size.width * 0.06,
                child: Image.asset('assets/images/review.png')),
            FadeInAnimation(child: Text("Vocabulary\nTừ vựng", textAlign: TextAlign.center,)),
            SizedBox(
                width: size.width * 0.06,
                child: Image.asset('assets/images/setting.png')),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers:[
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.00),
                  child: FadeInAnimation(
                      child:  Image.asset(
                    'assets/images/dragon.png',
                    fit: BoxFit.cover,
                  )),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: _topics.length,
                (context, index)=> TopicTile(topic: _topics[index])
            ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6
            ))
          ]
        ),
      ),




    );
  }
}
