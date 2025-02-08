import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/screens/invitation_varification/components/invitation_varification_form.dart';
import 'package:admin/app/screens/invitation_varification/controller/invitation_varification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationVarificationScreen
    extends GetView<InvitationVarificationController> {

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
                    InnerPadding(
                      child: LayoutBuilder(builder: (context, constraints) {
                        double formWidth = constraints.maxWidth < 400
                            ? constraints.maxWidth * 0.9
                            : 600;

                        return SizedBox(
                            width: formWidth,
                            child: InvitationVarificationForm());
                      }),
                    ),
                  ],
                ),
              ),
            ));
  }
}
