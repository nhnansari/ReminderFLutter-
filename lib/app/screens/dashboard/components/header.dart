import 'package:admin/app/controllers/MenuAppController.dart';
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final controller = Get.put(MenuAppController());
  Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backColor,
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      height: 60.h,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: controller.controlMenu,
            ),
          if (!Responsive.isMobile(context))
            Text(
              "Reminder App",
              style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          SmallButton(
            name: "Login",
            textColor: AppColors.whiteColor,
            backcolor: AppColors.primaryColor,
            fontSize: 13,
            onclick: () {
              Get.toNamed(AppRoutes.login);
            },
            width: 30.w,
            height: 40.h,
          ),
          width8,
          SmallButton(
            name: "SignUp",
            textColor: AppColors.whiteColor,
            backcolor: AppColors.primaryColor,
            fontSize: 13,
            width: 30.w,
            height: 40.h,
            onclick: () {
              Get.toNamed(AppRoutes.signUp);
            },
          ),
          // width8,
          // ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(color: AppColors.backColor),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 / 2),
              child: Text(
                "Angelina Jolie",
                style: AppTextstyle.text10.copyWith(
                  fontSize: FontSizeManager.getFontSize(context, 16),
                  color: AppColors.whiteColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: AppColors.secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(16 * 0.75),
            margin: EdgeInsets.symmetric(horizontal: 16 / 2),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
