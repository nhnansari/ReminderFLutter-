import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/custom_table.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/company_users/components/add_company_user_dailog.dart';
import 'package:admin/app/screens/company_users/controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompanyUserScreen extends GetView<CompanyUserController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyUserController>(
        init: CompanyUserController(),
        builder: (controller) => Title(
            color: AppColors.primaryColor,
            title: "Employees",
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Employees",
                            style: AppTextstyle.text10.copyWith(
                                fontSize:
                                    FontSizeManager.getFontSize(context, 18),
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildHistoryTextColumn(
                                        value: "Id",
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
                            ),
                            Divider(
                              color: AppColors.primaryColor,
                            ),
                            Obx(() => controller.companyUsers.isEmpty
                                ? Center(
                                    child: Text(
                                      "No Company Users Found!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                  )
                                : Column(
                                    children: List.generate(
                                      controller.companyUsers.length,
                                      (index) => Column(
                                        children: [
                                          CustomTable(
                                            id: controller
                                                .companyUsers[index].id
                                                .toString(),
                                            name: controller.companyUsers[index]
                                                .user!.fullName
                                                .toString(),
                                            email: controller
                                                .companyUsers[index].user!.email
                                                .toString(),
                                            role: "Worker",
                                            onTap: () {},
                                            additemRow: Expanded(
                                                child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .deleteCompanyUser(
                                                            controller
                                                                .companyUsers[
                                                                    index]
                                                                .user!
                                                                .id);
                                                  },
                                                  icon: Icon(Icons.delete,
                                                      color:
                                                          AppColors.errorColor),
                                                ),
                                                IconButton(
                                                  onPressed: () async {},
                                                  icon: Icon(Icons.edit,
                                                      color: AppColors
                                                          .secondaryColor),
                                                ),
                                              ],
                                            )),
                                          ),
                                          if (index <
                                              controller.companyUsers.length -
                                                  1)
                                            Container(
                                              height: 1.5.h,
                                              color: AppColors.secondaryColor
                                                  .withOpacity(0.5),
                                            ),
                                        ],
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      ),
                    )
                  ]),
            )));
  }
}
