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


import 'package:admin/app/core/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLoading {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void show({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
            child: Image.asset(
          AppImages.loader,
          filterQuality: FilterQuality.high,
          fit: BoxFit.scaleDown,
          height: 200.h,
        )),
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
