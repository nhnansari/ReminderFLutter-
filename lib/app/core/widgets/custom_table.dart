import 'package:reminder_app/app/core/utils/app_spaces.dart';

import '../utils/app_colors.dart';
import '../utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTable extends StatelessWidget {
  final String id, name, email, role;
  final VoidCallback onTap;
  final Widget? additemRow;
  final double? detailFontSize;

  const CustomTable({
    super.key,
    required this.id,
    required this.onTap,
    this.additemRow,
    this.detailFontSize,
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: Row(
        children: [
          Expanded(
              flex: -1,
              child: buildHistoryTextColumn(value: id, context: context)),
          width10,
          Expanded(
            child: buildHistoryTextColumn(context: context, value: name),
          ),
          Expanded(
            child: buildHistoryTextColumn(value: email, context: context),
          ),
          Expanded(
            child: buildHistoryTextColumn(value: role, context: context),
          ),
          additemRow ?? Column(),
        ],
      ),
    );
  }
}

Widget buildHistoryTextColumn(
    {required String value,
    required BuildContext context,
    FontWeight fontWeight = FontWeight.normal,
    double fonsize = 12}) {
  return Text(
    value,
    textAlign: TextAlign.start,
    overflow: TextOverflow.ellipsis,
    style: AppTextstyle.text12.copyWith(
        color: AppColors.blackColor,
        fontWeight: fontWeight,
        fontSize: FontSizeManager.getFontSize(context, fonsize)),
  );
}
