
import '../utils/app_colors.dart';
import '../utils/app_textstyle.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SmallButton extends StatelessWidget {
  final String name;
  final String? text;
  final double? height, width;
  final String? iconPath;
  final Color? backcolor, textColor, hoverColor, iconColor, borderColor;
  final double? fontSize;

  final void Function()? onclick;

  const SmallButton({
    super.key,
    required this.name,
    this.textColor,
    this.onclick,
    this.backcolor,
    this.hoverColor,
    this.height,
    this.width,
    this.iconPath,
    this.iconColor,
    this.borderColor,
    this.text,
    this.fontSize, // Default hover color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: Responsive.isMobile(context) ? 3.h : 5.h),
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? AppColors.transparentColor, width: 1.5),
            borderRadius: BorderRadius.circular(5.r),
            color: backcolor ?? AppColors.primaryColor),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              SvgPicture.asset(
                iconPath!,
                color: iconColor,
                height: 13.h,
                width: 12.w,
              ),
              SizedBox(
                width: 2.w,
              ),
            ],
            Text(
              name,
              textAlign: TextAlign.center,
              style: AppTextstyle.text14.copyWith(
                fontSize: FontSizeManager.getFontSize(
                  context,
                  fontSize ?? 12,
                ),
                fontWeight: FontWeight.w300,
                color: textColor ?? AppColors.textColor,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
