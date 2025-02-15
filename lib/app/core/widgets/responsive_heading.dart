import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHeading extends StatelessWidget {
  final String? text1, text2;
  final Color? dividerColor1, dividerColor2, textColor1, textColor2;
  final Widget child;

  final VoidCallback ontap1, ontap2;

  const ResponsiveHeading(
      {super.key,
      this.text1,
      this.text2,
      this.dividerColor1,
      this.dividerColor2,
      required this.ontap1,
      required this.ontap2,
      this.textColor1,
      this.textColor2,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: double.infinity,
        backColor: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(14))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    _column(
                        context: context,
                        text: text1,
                        textColor: textColor1,
                        dividerColor: dividerColor1,
                        ontap: ontap1),
                    SizedBox(width: 10),
                    _column(
                        context: context,
                        text: text2,
                        textColor: textColor2,
                        dividerColor: dividerColor2,
                        ontap: ontap2),
                  ],
                ),
              ),
            ),
            height10,
            child
          ],
        ));
  }
}

Widget _column({text, textColor, dividerColor, ontap, context}) {
  return InkWell(
    onTap: ontap,
    child: Column(
      children: [
        Text(
          text,
          style: AppTextstyle.text10.copyWith(
              fontSize: FontSizeManager.getFontSize(context, 14),
              color: textColor),
        ),
        SizedBox(
          height: 4,
        ),
        Container(color: dividerColor, height: 2, width: (text.length * 12))
      ],
    ),
  );
}
