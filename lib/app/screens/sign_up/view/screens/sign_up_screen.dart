import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/sign_up/components/sighnup_form.dart';
import 'package:admin/app/screens/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  final signUpFormKey = GlobalKey<FormState>();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    if (Responsive.isDesktop(context)) AuthHeader(),

                    height20,
                    if (!Responsive.isDesktop(context)) ...[
                      Image.asset(
                        AppImages.img1,
                        fit: BoxFit.scaleDown,
                        height: 200.h,
                        width: 300.w,
                      ),
                    ],
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 20.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (Responsive.isDesktop(context)) ...[
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AppImages.img1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            Expanded(
                              child: Form(
                                key: signUpFormKey,
                                child: SignUpForm(
                                  ontap: () {
                                    if (signUpFormKey.currentState!
                                        .validate()) {
                                      // print(controller.refId);
                                      controller.signUpUser();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),

                    // if (Responsive.isDesktop(context)) ...[
                    //   height40,
                    //   const AppFooter(),
                    // ]
                  ],
                ),
              ),
            ));
  }
}
