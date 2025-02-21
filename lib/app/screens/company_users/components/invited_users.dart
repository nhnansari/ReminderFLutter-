// ignore_for_file: deprecated_member_use

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/custom_table.dart';
import '../controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitedUsers extends StatelessWidget {
  final controller = Get.find<CompanyUserController>();
  InvitedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InnerPadding(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invited Employees",
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 18),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold)),
              height18,
              Row(
                children: [
                  Expanded(
                    flex: -1,
                    child: buildHistoryTextColumn(
                        value: "#",
                        context: context,
                        fontWeight: FontWeight.bold,
                        fonsize: 14),
                  ),
                  width10,
                  Expanded(
                    flex: 2,
                    child: buildHistoryTextColumn(
                        context: context,
                        value: "Email",
                        fontWeight: FontWeight.bold,
                        fonsize: 14),
                  ),
                  Expanded(
                    child: buildHistoryTextColumn(
                        value: "Role",
                        context: context,
                        fontWeight: FontWeight.bold,
                        fonsize: 14),
                  ),
                  Expanded(
                    child: buildHistoryTextColumn(
                        value: "Action",
                        context: context,
                        fontWeight: FontWeight.bold,
                        fonsize: 14),
                  ),
                ],
              ),
              height6,
              Divider(
                color: AppColors.primaryColor,
              ),
              Obx(
                ()=> controller.invitedUsers.value.isEmpty
                    ? Center(
                        child: Text(
                          "No Invited  Users Found!",
                          style: TextStyle(
                              fontSize: FontSizeManager.getFontSize(context, 12),
                              fontWeight: FontWeight.normal,
                              color: AppColors.greyColor),
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              controller.invitedUsers.length,
                              (index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:-1,
                                          child: buildHistoryTextColumn(
                                              value: (index + 1).toString(),
                                              context: context)),
                                      width10,
                                      Expanded(
                                        flex: 2,
                                        child: buildHistoryTextColumn(
                                            value: controller
                                                .invitedUsers[index].email
                                                .toString(),
                                            context: context),
                                      ),
                                      Expanded(
                                        child: buildHistoryTextColumn(
                                            value: controller
                                                    .invitedUsers[index].role ??
                                                "No Role",
                                            context: context),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller.cancelInvitation(
                                                    controller
                                                        .invitedUsers[index].id);
                                              },
                                              icon: Icon(Icons.cancel,
                                                  color: AppColors.errorColor),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  height6,
                                  if (index < controller.invitedUsers.length - 1)
                                    Container(
                                      height: 1,
                                      color: AppColors.secondaryColor
                                          .withOpacity(0.35),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        
      ),
    );
  }
}
