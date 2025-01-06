import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/login/components/form.dart';
import 'package:admin/app/screens/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  final loginFormKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                      child: Obx(() => Row(
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
                                  key: loginFormKey,
                                  child: LoginForm(
                                    onForgetPassowrd: () {},
                                    onRegister: () {
                                      // Get.toNamed(AppRoutes.signUp);
                                    },
                                    // on button
                                    ontap: () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        controller.loginUser(context: context);
                                      }
                                      //  Get.toNamed(AppRoutes.emailVarification , arguments: true);
                                      // Get.offNamed(AppRoutes.index);
                                    },
                                    emailController: controller.emailcontroller,
                                    passwordController:
                                        controller.passwordcontroller,
                                    obsuretext: controller.obscure.value,
                                    checkBoxValue: controller.ischeck.value,
                                    onCheckBoxValueChange: (v) {
                                      controller.ischeck.value = v!;
                                    },
                                    onPassword: () {
                                      controller.setObsureText();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
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
