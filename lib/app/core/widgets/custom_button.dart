import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor, backColor;
  final Color? splashColor;
  final VoidCallback ontap;
  final bool loading;
  const CustomButton(
      {super.key,
      this.loading = false,
      required this.text,
      required this.textColor,
      required this.backColor,
      required this.ontap,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.29),
              offset: const Offset(3, 4),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12.r),
        color: backColor,
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(12.r),
          splashColor: splashColor ?? AppColors.primaryColor,
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 2,
                  )
                : Text(
                    textAlign: TextAlign.center,
                    text,
                    style: AppTextstyle.text18.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 14),
                        color: textColor),
                  ),
          ),
        ),
      ),
    );
  }
}
