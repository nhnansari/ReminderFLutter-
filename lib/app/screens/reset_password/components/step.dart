import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormStepper extends StatelessWidget {
  final int currentIndex;
  const FormStepper({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reset Password",
                style: AppTextstyle.text13.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 11),
                ),
              ),
              Text(
                "Email Varificaton",
                style: AppTextstyle.text13.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 11),
                ),
              ),
              Text(
                "     Done",
                style: AppTextstyle.text13.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 11),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 1.h,
                  color: AppColors.greyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        circle(
                            context: context,
                            number: "1",
                            borderColor: AppColors.textColor,
                            backColor: currentIndex <= 2
                                ? AppColors.textColor
                                : AppColors.whiteColor,
                            textColor: currentIndex <= 2
                                ? AppColors.whiteColor
                                : AppColors.textColor),
                      ],
                    ),
                    circle(
                        context: context,
                        number: "2",
                        borderColor: AppColors.textColor,
                        backColor: currentIndex > 0 && currentIndex <= 2
                            ? AppColors.textColor
                            : AppColors.whiteColor,
                        textColor: currentIndex > 0 && currentIndex <= 2
                            ? AppColors.whiteColor
                            : AppColors.textColor),
                    circle(
                        context: context,
                        number: "3",
                        borderColor:  AppColors.textColor,
                        backColor: currentIndex == 2
                            ? AppColors.textColor
                            : AppColors.whiteColor,
                        textColor: currentIndex == 2
                            ? AppColors.whiteColor
                            : AppColors.textColor)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget circle(
    {required String number,
    required Color borderColor,
    required Color textColor,
    required BuildContext context,
    required backColor}) {
  return Container(
    padding: EdgeInsets.all(10.r),
    decoration: BoxDecoration(
        color: backColor,
        border: Border.all(
          color: borderColor,
        ),
        shape: BoxShape.circle),
    child: Center(
      child: Text(
        number,
        style: AppTextstyle.text14.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 12),
            color: textColor),
      ),
    ),
  );
}
