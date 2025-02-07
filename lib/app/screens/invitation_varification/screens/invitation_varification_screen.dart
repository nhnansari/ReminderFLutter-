import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/invitation_varification/components/invitation_varification_form.dart';
import 'package:admin/app/screens/invitation_varification/controller/invitation_varification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InvitationVarificationScreen
    extends GetView<InvitationVarificationController> {
  final loginFormKey = GlobalKey<FormState>();
  InvitationVarificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvitationVarificationController>(
        init: InvitationVarificationController(),
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
                              child: InvitationVarificationForm(),
                            )),
                      ),
                    ),
                  
                  ],
                ),
              ),
            ));
  }
}
