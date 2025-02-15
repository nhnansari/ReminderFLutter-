// import 'package:ebp_flutter/app/core/custom_widgets/custom_snackbar.dart';
// import 'package:ebp_flutter/app/core/utils/app_textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../utils/app_colors.dart';

// class Loading  {

//   OverlayEntry? _overlayEntry;

//   void showOverlay(BuildContext context) {
//     if (_overlayEntry == null) {
//       _overlayEntry = OverlayEntry(
//         builder: (context) => Material(
//           color: Colors.black.withOpacity(0.5),
//           child: Center(
//             child: CircularProgressIndicator(
//               color: AppColors.secondaryColor,
//             ),
//           ),
//         ),
//       );

//       Overlay.of(context).insert(_overlayEntry!);
//     }
//   }

//   void hideOverlay() {
//     if (_overlayEntry != null) {
//       _overlayEntry!.remove();
//       _overlayEntry = null;
//     }
//   }
// }

import '../utils/app_colors.dart';
import '../utils/app_textstyle.dart';
import 'Custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoading {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void show({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
            child: CustomContainer(
                backColor: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primaryColor,
                        strokeWidth: 4,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        " Loading...",
                        style: AppTextstyle.text12.copyWith(
                            color: AppColors.backColor,
                            fontSize:
                                FontSizeManager.getFontSize(Get.context!, 12)),
                      )
                    ],
                  ),
                ))),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hide() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}
