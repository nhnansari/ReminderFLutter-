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
                    AuthHeader(),

                    height20,

                    Container(
                      constraints: BoxConstraints(
                          maxWidth: Responsive.isDesktop(context)
                              ? 150.w
                              : Responsive.isMobile(context)
                                  ? 240.w
                                  : 320.w),
                      child: Center(
                        child: Obx(() => Form(
                              key: loginFormKey,
                              child: LoginForm(
                                onForgetPassowrd: () {},
                                onRegister: () {
                                  // Get.toNamed(AppRoutes.signUp);
                                },
                                // on button
                                ontap: () {
                                  if (loginFormKey.currentState!.validate()) {
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
                            )),
                      ),
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
