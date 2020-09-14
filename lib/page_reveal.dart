

import 'dart:math';

import 'package:flutter/cupertino.dart';

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  const PageReveal({Key key, this.revealPercent, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect>{
  final double revealPercent;

  CircleRevealClipper(this.revealPercent);
  @override
  getClip(Size size) {
    final epicenter = Offset(size.width / 2, size.height * 0.9);
    double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToCorner = epicenter.dy/sin(theta);

    final radius = distanceToCorner * revealPercent;
    final diameter = 2* radius;
    return Rect.fromLTWH(epicenter.dx-radius, epicenter.dy-radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}





















