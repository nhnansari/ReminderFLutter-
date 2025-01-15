import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InnerPadding extends StatefulWidget {
  final Widget child;

  InnerPadding({required this.child});

  @override
  _InnerPaddingState createState() => _InnerPaddingState();
}

class _InnerPaddingState extends State<InnerPadding> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    EdgeInsetsGeometry getPadding() {
      if (screenWidth < 300) {
        return EdgeInsets.symmetric(horizontal: 10, vertical: 8);
      } else if (screenWidth < 600) {
        return EdgeInsets.symmetric(horizontal: 15, vertical: 10);
      } else if (screenWidth < 900) {
        return EdgeInsets.symmetric(horizontal: 15, vertical: 10);
      } else if (screenWidth < 1100) {
        return EdgeInsets.symmetric(horizontal: 15, vertical: 15);
      } else {
        return EdgeInsets.symmetric(horizontal: 15, vertical: 15);
      }
    }

    return Padding(
      padding: getPadding(),
      child: widget.child,
    );
  }
}
