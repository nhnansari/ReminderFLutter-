import '../utils/app_textstyle.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class Pagination extends StatelessWidget {
  final VoidCallback onPrevious, onNext;
  final Function(int) goToPage;
  final int totalPages;
  final int currentPage;

  const Pagination({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.totalPages,
    required this.currentPage,
    required this.goToPage,
  });

  @override
  Widget build(BuildContext context) {
    bool isPreviousDisabled = currentPage <= 1;
    bool isNextDisabled = currentPage >= totalPages;

    // Calculate the visible range
    int startPage = ((currentPage - 1) ~/ 10) * 10 + 1;
    int endPage = (startPage + 9).clamp(1, totalPages);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // _paginationButton(
          //     Icons.arrow_left, onPrevious, context, isPreviousDisabled),
          InkWell(
            onTap: isPreviousDisabled ? () {} : onPrevious,
            child: Row(
              children: [
                Icon(Icons.arrow_left,
                    color: isPreviousDisabled
                        ? AppColors.greyColor // Disabled color
                        : AppColors.primaryColor,
                    size: Responsive.isMobile(context)
                        ? 30.sp
                        : Responsive.isTablet(context)
                            ? 20.sp
                            : 10.sp),
                Text(
                  "Previous",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Show "..." before the first visible page range if applicable
          if (startPage > 1) _ellipsis(context),

          // Generate visible pages
          ...List.generate(
            endPage - startPage + 1,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: InkWell(
                onTap: () => goToPage(startPage + index),
                child: Text(
                  '${startPage + index}',
                  style: AppTextstyle.text12.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 11),
                    color: currentPage == startPage + index
                        ? AppColors.primaryColor
                        : AppColors.greyColor,
                    fontWeight: currentPage == startPage + index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

          // Show "..." after the last visible page range if applicable
          if (endPage < totalPages) _ellipsis(context),

          InkWell(
            onTap: isNextDisabled ? () {} : onNext,
            child: Row(
              children: [
                Text(
                  "Next",
                  style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 12),
                    color: AppColors.secondaryColor,
                  ),
                ),
                Icon(Icons.arrow_right,
                    color: isNextDisabled
                        ? AppColors.greyColor // Disabled color
                        : AppColors.primaryColor,
                    size: Responsive.isMobile(context)
                        ? 30.sp
                        : Responsive.isTablet(context)
                            ? 20.sp
                            : 10.sp),
              ],
            ),
          ),
          // _paginationButton(Icons.arrow_right, onNext, context, isNextDisabled),
        ],
      ),
    );
  }

  // Common Pagination Button
  // Widget _paginationButton(IconData icon, VoidCallback onPressed,
  //     BuildContext context, bool isDisabled) {
  //   return IconButton(
  //     padding: EdgeInsets.zero,
  //     icon: Icon(icon,
  //         color: isDisabled
  //             ? AppColors.greyColor // Disabled color
  //             : AppColors.secondaryColor,
  //         size: Responsive(mobile: mobile, desktop: desktop).issmallscreen(context)
  //             ? 30.sp
  //             : Responsive(mobile: mobile, desktop: desktop).ismediumscreen(context)
  //                 ? 20.sp
  //                 : 10.sp),
  //     onPressed: isDisabled ? null : onPressed, // Disable button when needed
  //   );
  // }

  // Widget _paginationText(String text, BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 5.w),
  //     child: Text(
  //       text,
  //       style: AppTextstyle.text10.copyWith(
  //         fontSize: FontSizeManager.getFontSize(context, 12),
  //         color: AppColors.primaryColor,
  //       ),
  //     ),
  //   );
  // }

  // Ellipsis Widget
  Widget _ellipsis(context) {
    return Text(
      '  ...  ',
      style: AppTextstyle.text10.copyWith(
        fontSize: FontSizeManager.getFontSize(context, 18),
        color: AppColors.greyColor,
      ),
    );
  }
}
