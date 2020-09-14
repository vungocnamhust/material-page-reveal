import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/pages.dart';

class PageIndicator extends StatelessWidget {
  final PageIndicatorViewModel viewModel;

  const PageIndicator({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (int i = 0; i < viewModel.viewModels.length; i++) {
      bubbles.add(
        PageBubble(
          viewModel: PageBubbleViewModel(
              Colors.white, i == viewModel.activeIndex ? 1 : 0.3, Icons.folder),
        ),
      );
    }

    final bubbleWidth = 50;
    final baseTranslation = (bubbleWidth * (viewModel.viewModels.length - 1)) / 2;
    final translation = baseTranslation - bubbleWidth * viewModel.activeIndex;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
          transform: Matrix4.translationValues(translation, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bubbles,
          ),
        )
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  const PageBubble({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: viewModel.activePercent,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: lerpDouble(10, 50, viewModel.activePercent),
          width: lerpDouble(10, 50, viewModel.activePercent),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.color,
          ),
          child: Icon(
            viewModel.icons,
            color: Colors.blue,
            size: lerpDouble(0, 25, viewModel.activePercent),
          ),
        ),
      ),
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PageIndicatorViewModel {
  final List<PageViewModel> viewModels;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndicatorViewModel(this.viewModels, this.activeIndex, this.slideDirection,
      this.slidePercent);
}

class PageBubbleViewModel {
  final Color color;
  final double activePercent;
  final IconData icons;

  PageBubbleViewModel(this.color, this.activePercent, this.icons);
}
