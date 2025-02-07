import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:flutter/material.dart';

class FileInfoCard extends StatelessWidget {
  final String title, Total;
  final IconData iconPath;
  FileInfoCard({
    Key? key,
    required this.title,
    required this.Total,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backColor: AppColors.whiteColor,
      borderColor: AppColors.backColor,
      child: InnerPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(
                      iconPath,
                      color: AppColors.whiteColor,
                    )),
                Text(
                  "  ${title}",
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 14),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  Total,
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 30),
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color ?? AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
