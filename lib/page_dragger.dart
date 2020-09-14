import 'package:flutter/cupertino.dart';
import 'package:flutter_animation/page_indicator.dart';

class PageDragger extends StatefulWidget {
  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const FULL_TRANSITION_PX = 300;
  Offset dragStart;
  SlideDirection slideDirection;
  double slidePercent = 0;

  onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final dx = dragStart.dx - newPosition.dx;
      dx > 0
          ? slideDirection = SlideDirection.rightToLeft
          : dx < 0
          ? slideDirection = SlideDirection.leftToRight
          : slideDirection = SlideDirection.none;

      slidePercent = (dx/FULL_TRANSITION_PX).abs().clamp(0, 1);
      print("Drag $slideDirection $slidePercent");
    }
  }

  onDragEnd(DragEndDetails details) {
    dragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}
