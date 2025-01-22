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
                    AuthHeader(),

                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 20.h),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: Responsive.isDesktop(context)
                                  ? 150.w
                                  : Responsive.isTablet(context)
                                      ? 240.w
                                      : 320.w),
                          child: Form(
                            key: signUpFormKey,
                            child: SignUpForm(
                              ontap: () {
                                if (signUpFormKey.currentState!.validate()) {
                                  // print(controller.refId);
                                  controller.signUpUser();
                                }
                              },
                            ),
                          ),
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
