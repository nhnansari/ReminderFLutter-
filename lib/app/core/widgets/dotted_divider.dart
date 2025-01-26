import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double dashWidth;
  final double dashSpace;

  const DottedDivider({
    Key? key,
    this.color = Colors.grey,
    this.height = 1.0,
    this.dashWidth = 4.0,
    this.dashSpace = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ensure the total width is greater than 0 to prevent NaN or Infinity
        if (constraints.maxWidth <= 0) {
          return SizedBox.shrink(); // Return an empty widget
        }

        final double dashCount = constraints.constrainWidth() / (dashWidth + dashSpace);

        return Row(
          children: List.generate(dashCount.floor(), (index) {
            return Padding(
              padding: EdgeInsets.only(right: dashSpace),
              child: SizedBox(
                width: dashWidth,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}