import 'package:flutter/material.dart';

import '/config/_config.dart' show ResponsiveLayout, TPadding;

class CustomPadding extends StatelessWidget {
  const CustomPadding({
    super.key,
    required this.child,
    this.showVerticalPadding = true,
  });
  final Widget child;
  final bool showVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallLayout: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TPadding.p16,
          vertical: showVerticalPadding ? TPadding.p16 : 0,
        ),
        child: child,
      ),
      mediumLayout: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TPadding.p80,
          vertical: showVerticalPadding ? TPadding.p24 : 0,
        ),
        child: child,
      ),
      largeLayout: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TPadding.p160,
          vertical: showVerticalPadding ? TPadding.p48 : 0,
        ),
        child: child,
      ),
    );
  }
}
