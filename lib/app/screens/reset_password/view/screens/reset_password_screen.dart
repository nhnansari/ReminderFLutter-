import '../../../../core/utils/app_spaces.dart';
import '../../../../core/widgets/InnerPadding.dart';
import '../../../../core/widgets/auth_header.dart';
import '../../components/reset_password_form.dart';
import '../../controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        builder: (controller) => SingleChildScrollView(
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
                          width: formWidth, child: ResetPasswordForm());
                    }),
                  ),
                ],
              ),
            ));
  }
}
