import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/compines_details/nested_screens/company_users/components/add_company_user_dailog.dart';
import 'package:admin/app/screens/compines_details/nested_screens/company_users/controller/company_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyUserScreen extends GetView<CompanyUserController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyUserController>(
        init: CompanyUserController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Employees",
              child: Column(children: [
                Expanded(
                  child: InnerPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Employees",
                                style: AppTextstyle.text10.copyWith(
                                    fontSize: FontSizeManager.getFontSize(
                                        context, 18),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold)),
                            // Obx(
                            //   () => CustomTextfeild(
                            //     // title: "Role",
                            //     hinttext: "Choose role",
                            //     dropdownItems: ["Admin", "Worker", "Manager"],
                            //     onDropdownChanged: (v) {
                            //       controller.selectedItem.value = v!;
                            //     },
                            //     selectedItem: controller.selectedItem.value,
                            //     validator: (v) => v?.isEmpty ?? true
                            //         ? "Role is required"
                            //         : null,
                            //   ),
                            // ),
                            SmallButton(
                                name: "Add Employee",
                                textColor: AppColors.whiteColor,
                                backcolor: AppColors.secondaryColor,
                                onclick: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AddCompanyUserDailog());
                                })
                          ],
                        ),
                        height18,
                        // Expanded(
                        //   child: SingleChildScrollView(
                        //     child: Obx(
                        //       () => controller.companies.isEmpty
                        //           ? InnerPadding(
                        //               child: Center(
                        //                 child: Text("No Company Found!",
                        //                     style: AppTextstyle.text10.copyWith(
                        //                         fontSize:
                        //                             FontSizeManager.getFontSize(
                        //                                 context, 14),
                        //                         color: AppColors.whiteColor,
                        //                         fontWeight: FontWeight.normal)),
                        //               ),
                        //             )
                        //           : Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: List.generate(
                        //                   controller.companies.length,
                        //                   (index) => InkWell(
                        //                         onTap: () {
                        //                           Get.toNamed(
                        //                               AppRoutes.compainesDetails);
                        //                         },
                        //                         child: CustomContainer(
                        //                             boxConstraints:
                        //                                 BoxConstraints(
                        //                                     maxWidth: 150.w),
                        //                             borderColor:
                        //                                 AppColors.primaryColor,
                        //                             margin: EdgeInsets.only(
                        //                                 bottom: 10),
                        //                             backColor:
                        //                                 AppColors.whiteColor,
                        //                             child: InnerPadding(
                        //                               child: Row(
                        //                                 children: [
                        //                                   CircleAvatar(
                        //                                     maxRadius: 20.r,
                        //                                     backgroundImage: controller
                        //                                                 .companies[
                        //                                                     index]
                        //                                                 .logo !=
                        //                                             null
                        //                                         ? NetworkImage(
                        //                                             controller
                        //                                                 .companies[
                        //                                                     index]
                        //                                                 .logo!)
                        //                                         : AssetImage(
                        //                                             AppImages
                        //                                                 .profile,
                        //                                           ),
                        //                                   ),
                        //                                   VerticalDivider(),
                        //                                   Text(controller.companies[index].name!,
                        //                                       style: AppTextstyle.text10.copyWith(
                        //                                           fontSize: FontSizeManager
                        //                                               .getFontSize(
                        //                                                   context,
                        //                                                   14),
                        //                                           color: AppColors
                        //                                               .textColor,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .normal)),
                        //                                   // VerticalDivider(),
                        //                                   // SmallButton(
                        //                                   //   name: "Go To Company",
                        //                                   //   backcolor: AppColors.secondaryColor,
                        //                                   //   textColor: AppColors.whiteColor,
                        //                                   //   onclick: () {
                        //                                   //     Get.offAllNamed(AppRoutes.main);
                        //                                   //   },
                        //                                   // )
                        //                                 ],
                        //                               ),
                        //                             )),
                        //                       )),
                        //             ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )
              ]),
            ));
  }
}
