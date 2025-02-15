
import '../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double? height, width;
  final EdgeInsetsGeometry? padding, margin;
  final Color? backColor, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final BoxConstraints? boxConstraints;
  final bool isBoxShadow;
  final Alignment? alignment;

  const CustomContainer(
      {super.key,
      this.height,
      this.width,
      this.backColor,
      this.borderRadius,
      this.borderColor,
      required this.child,
      this.padding,
      this.margin,
      this.isBoxShadow = true,
      this.boxConstraints,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstraints,
      clipBehavior: Clip.hardEdge,
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backColor ?? AppColors.backColor,
        border: Border.all(color: borderColor ?? AppColors.transparentColor),
        borderRadius: borderRadius ?? BorderRadius.circular(16.r),
        boxShadow: isBoxShadow
            ? [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 0.1,
                  offset: const Offset(1, 1),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
