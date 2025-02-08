// ignore_for_file: invalid_use_of_protected_member

import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/dotted_divider.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/reminders/components/send_reminder_dialog.dart';
import 'package:admin/app/screens/reminders/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderScreen extends GetView<ReminderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReminderController>(
        init: ReminderController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Reminders",
              child: Column(children: [
                Expanded(
                  child: InnerPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reminders",
                                  style: AppTextstyle.text10.copyWith(
                                      fontSize: FontSizeManager.getFontSize(
                                          context, 18),
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold)),
                              if (controller.isWorker.value == "admin")
                                SmallButton(
                                    name: "Send Reminder",
                                    textColor: AppColors.whiteColor,
                                    backcolor: AppColors.secondaryColor,
                                    onclick: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              SendReminderDialog());
                                    })
                            ],
                          ),
                        ),
                        height18,
                        // Expanded(
                        //   child: Obx(
                        //     () => (controller.teams.isEmpty)
                        //         ? Center(
                        //             child: Text(
                        //               "No Teams Found!",
                        //               style: AppTextstyle.text10.copyWith(
                        //                 fontSize: FontSizeManager.getFontSize(
                        //                     context, 14),
                        //                 color: AppColors.backColor,
                        //                 fontWeight: FontWeight.normal,
                        //               ),
                        //             ),
                        //           )
                        //         : SingleChildScrollView(
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: List.generate(
                        //                 controller
                        //                     .teams.length, // Null check added
                        //                 (index) {
                        //                   final team = controller.teams[index];
                        //                   return InkWell(
                        //                     onTap: () {},
                        //                     child: CustomContainer(
                        //                       borderColor: AppColors.backColor,
                        //                       margin:
                        //                           EdgeInsets.only(bottom: 10),
                        //                       backColor: AppColors.whiteColor,
                        //                       child: InnerPadding(
                        //                         child: Column(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment.start,
                        //                           children: [
                        //                             Row(
                        //                               children: [
                        //                                 Expanded(
                        //                                   child: Column(
                        //                                     crossAxisAlignment:
                        //                                         CrossAxisAlignment
                        //                                             .start,
                        //                                     children: [
                        //                                       Text(
                        //                                         team.name ??
                        //                                             "No Name",
                        //                                         style:
                        //                                             AppTextstyle
                        //                                                 .text10
                        //                                                 .copyWith(
                        //                                           fontSize: FontSizeManager
                        //                                               .getFontSize(
                        //                                                   context,
                        //                                                   13),
                        //                                           color: AppColors
                        //                                               .textColor,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .bold,
                        //                                         ),
                        //                                       ),
                        //                                       Text(
                        //                                         team.description ??
                        //                                             "No Description",
                        //                                         style:
                        //                                             AppTextstyle
                        //                                                 .text10
                        //                                                 .copyWith(
                        //                                           fontSize: FontSizeManager
                        //                                               .getFontSize(
                        //                                                   context,
                        //                                                   12),
                        //                                           color: AppColors
                        //                                               .textColor,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .normal,
                        //                                         ),
                        //                                       ),
                        //                                     ],
                        //                                   ),
                        //                                 ),
                        //                                 if (controller.isWorker
                        //                                         .value ==
                        //                                     "admin") ...[
                        //                                   IconButton(
                        //                                     onPressed:
                        //                                         () async {
                        //                                       Get.dialog(AddWorkerDailog(
                        //                                           teamData: controller
                        //                                                   .teams[
                        //                                               index]));
                        //                                     },
                        //                                     icon: Icon(
                        //                                         Icons
                        //                                             .add_circle_outline_rounded,
                        //                                         color: AppColors
                        //                                             .secondaryColor),
                        //                                   ),
                        //                                   IconButton(
                        //                                     onPressed: () {
                        //                                       controller
                        //                                           .deleteteam(
                        //                                               team.id);
                        //                                     },
                        //                                     icon: Icon(
                        //                                         Icons.delete,
                        //                                         color: AppColors
                        //                                             .errorColor),
                        //                                   ),
                        //                                   IconButton(
                        //                                     onPressed:
                        //                                         () async {
                        //                                       controller
                        //                                               .descController
                        //                                               .text =
                        //                                           controller
                        //                                               .teams[
                        //                                                   index]
                        //                                               .description
                        //                                               .toString();
                        //                                       controller
                        //                                               .nameController
                        //                                               .text =
                        //                                           controller
                        //                                               .teams[
                        //                                                   index]
                        //                                               .name
                        //                                               .toString();
                        //                                       Get.dialog(AddTeamDailog(
                        //                                           teamData: controller
                        //                                                   .teams[
                        //                                               index]));
                        //                                     },
                        //                                     icon: Icon(
                        //                                         Icons.edit,
                        //                                         color: AppColors
                        //                                             .secondaryColor),
                        //                                   ),
                        //                                 ],
                        //                               ],
                        //                             ),
                        //                             height6,
                        //                             Text(
                        //                               "Team Member :",
                        //                               style: AppTextstyle.text10
                        //                                   .copyWith(
                        //                                 fontSize:
                        //                                     FontSizeManager
                        //                                         .getFontSize(
                        //                                             context,
                        //                                             13),
                        //                                 color: AppColors
                        //                                     .secondaryColor,
                        //                                 fontWeight:
                        //                                     FontWeight.normal,
                        //                               ),
                        //                             ),
                        //                             // height12,
                        //                             controller
                        //                                         .teams
                        //                                         .value[index]
                        //                                         .members ==
                        //                                     null
                        //                                 ? Center(
                        //                                     child: Text(
                        //                                       "No Members Found!",
                        //                                       style:
                        //                                           AppTextstyle
                        //                                               .text10
                        //                                               .copyWith(
                        //                                         fontSize: FontSizeManager
                        //                                             .getFontSize(
                        //                                                 context,
                        //                                                 12),
                        //                                         color: AppColors
                        //                                             .greyColor,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .normal,
                        //                                       ),
                        //                                     ),
                        //                                   )
                        //                                 : Column(
                        //                                     children:
                        //                                         List.generate(
                        //                                       controller
                        //                                           .teams[index]
                        //                                           .members!
                        //                                           .length,
                        //                                       (index1) => row(
                        //                                           context:
                        //                                               context,
                        //                                           text: "Name",
                        //                                           status: controller
                        //                                               .teams[
                        //                                                   index]
                        //                                               .members![
                        //                                                   index1]
                        //                                               .fullName),
                        //                                     ),
                        //                                   ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //   ),
                        // ),
                    
                      ],
                    ),
                  ),
                )
              ]),
            ));
  }
}

Widget row({text, status, context}) {
  return Row(
    children: [
      Text(text,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 11),
            color: AppColors.greyColor,
          )),
      width4,
      Expanded(
        child: DottedDivider(
          color: AppColors.greyColor, // Use your existing AppColors
          height: 1.0, // Adjust thickness
          dashWidth: 5.0, // Width of each dash
          dashSpace: 4.0, // Space between dashes
        ),
      ),
      width4,
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.backColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: AppTextstyle.text10.copyWith(
            fontSize: FontSizeManager.getFontSize(context, 12),
            color: AppColors.textColor,
          ),
        ),
      ),
    ],
  );
}
