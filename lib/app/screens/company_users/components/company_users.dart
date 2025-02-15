// ignore_for_file: deprecated_member_use

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/custom_table.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/company_users/components/add_company_user_dailog.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyUsers extends StatelessWidget {
  final controller = Get.find<CompanyUserController>();
  CompanyUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InnerPadding(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Employees",
                    style: AppTextstyle.text10.copyWith(
                        fontSize: FontSizeManager.getFontSize(context, 18),
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold)),
                SmallButton(
                    name: "Add Employee",
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.secondaryColor,
                    onclick: () {
                      showDialog(
                          context: context,
                          builder: (context) => AddCompanyUserDailog());
                    })
              ],
            ),
            height18,
            Row(
              children: [
                Expanded(
                  child: buildHistoryTextColumn(
                      value: "#",
                      context: context,
                      fontWeight: FontWeight.bold,
                      fonsize: 14),
                ),
                Expanded(
                  child: buildHistoryTextColumn(
                      context: context,
                      value: "Name",
                      fontWeight: FontWeight.bold,
                      fonsize: 14),
                ),
                Expanded(
                  child: buildHistoryTextColumn(
                      value: "Email",
                      context: context,
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
            Obx(() => controller.companyUsers.isEmpty
                ? Center(
                    child: Text(
                      "No Company Users Found!",
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
                          controller.companyUsers.length,
                          (index) => Column(
                            children: [
                              CustomTable(
                                id: (index + 1).toString(),
                                name: controller
                                    .companyUsers[index].user!.fullName
                                    .toString(),
                                email: controller
                                    .companyUsers[index].user!.email
                                    .toString(),
                                role: controller.companyUsers[index].role!,
                                onTap: () {},
                                additemRow: Expanded(
                                    child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.deleteCompanyUser(controller
                                            .companyUsers[index].user!.id);
                                      },
                                      icon: Icon(Icons.delete,
                                          color: AppColors.errorColor),
                                    ),
                                  ],
                                )),
                              ),
                              if (index < controller.companyUsers.length - 1)
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
                  )),
          ],
        ),
      ),
    );
  }
}
