import 'package:flutter/material.dart';
import 'package:flutter_animation/page_dragger.dart';
import 'package:flutter_animation/page_indicator.dart';
import 'package:flutter_animation/page_reveal.dart';
import 'package:flutter_animation/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<PageViewModel> pageViewModels = [
    PageViewModel(
        Colors.blue,
        'Hello Mickey, my name is Nam, I love you',
        Icon(
          Icons.home_work_sharp,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.blueGrey,
        'Hello Sam sam, my name is Nam, I love you',
        Icon(
          Icons.mail,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.orange,
        'Hello Han han, my name is Nam, I love you',
        Icon(
          Icons.contact_mail_rounded,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.orange,
        'Hello Han han, my name is Nam, I love you',
        Icon(
          Icons.contact_mail_rounded,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.orange,
        'Hello Han han, my name is Nam, I love you',
        Icon(
          Icons.contact_mail_rounded,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.orange,
        'Hello Han han, my name is Nam, I love you',
        Icon(
          Icons.contact_mail_rounded,
          size: 80,
        ),
        "I love you too"),
    PageViewModel(
        Colors.orange,
        'Hello Han han, my name is Nam, I love you',
        Icon(
          Icons.contact_mail_rounded,
          size: 80,
        ),
        "I love you too"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CustomPage(
              pageViewModel: pageViewModels[2],
              percentVisible: 1,
            ),
            PageReveal(
              revealPercent: 0.7,
              child: CustomPage(
                pageViewModel: pageViewModels[1],
                percentVisible: 1,
              ),
            ),

            PageIndicator(
              viewModel: PageIndicatorViewModel(
                  pageViewModels, 2, SlideDirection.leftToRight, 1),
            ),
            PageDragger(

            )
          ],
        ),
      ),
    );
  }
}
