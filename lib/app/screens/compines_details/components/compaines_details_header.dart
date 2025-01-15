import 'package:admin/app/core/assets/app_icons.dart';
import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/taps.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:admin/app/screens/compines_details/controller/compaines_datails_controller.dart.dart';
import 'package:admin/app/screens/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompainesDetailsHeader extends StatelessWidget {
  final controller = Get.put(CompainesDetailsController());
  CompainesDetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: InnerPadding(
        child: Row(
          children: [
            Image.asset(
              AppImages.logo,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            // if (!Responsive.isDesktop(context))
            //   IconButton(
            //     icon: Icon(Icons.menu),
            //     onPressed: controller.controlMenu,
            //   ),

            Text(
              "Reminder App",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(AppRoutes.main);
                Get.put(MainController())
                    .changeIndex(dashboardTaps.Companies.index);
              },
              child: Text(
                " > Compines  >",
                style: AppTextstyle.text10.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 14),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              controller.companiesModel.value.name.toString(),
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 14),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal),
            ),
            Spacer(),

            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 23.r,
              child: SvgPicture.asset(
                AppIcons.notification,
                color: AppColors.whiteColor,
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              backgroundImage: AssetImage(AppImages.profile),
              radius: 23.r,
            ),

            SizedBox(
              width: 10,
            ),
            Text(
              "Malik Imran",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),

            // width8,
            // ProfileCard()
          ],
        ),
      ),
    );
  }
}
