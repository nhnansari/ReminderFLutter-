import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/screens/sign_up/components/sighnup_form.dart';
import 'package:admin/app/screens/sign_up/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
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
                    InnerPadding(
                      child: LayoutBuilder(builder: (context, constraints) {
                        double formWidth = constraints.maxWidth < 400
                            ? constraints.maxWidth * 0.9
                            : 600;

                        return SizedBox(
                          width: formWidth,
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
