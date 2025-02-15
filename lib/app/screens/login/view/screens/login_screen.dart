import '../../../../core/utils/app_spaces.dart';
import '../../../../core/widgets/InnerPadding.dart';
import '../../../../core/widgets/auth_header.dart';
import '../../components/form.dart';
import '../../controller/login_controller.dart';
import 'package:flutter/material.dart';
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

                    InnerPadding(
                      child: LayoutBuilder(builder: (context, constraints) {
                        double formWidth = constraints.maxWidth < 400
                            ? constraints.maxWidth * 0.9
                            : 600;

                        return SizedBox(
                          width: formWidth,
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
                        );
                      }),
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
