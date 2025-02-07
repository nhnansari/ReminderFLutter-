import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/dotted_divider.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/screens/team/components/add_team_dailog.dart';
import 'package:admin/app/screens/team/components/add_worker_dailog.dart';
import 'package:admin/app/screens/team/controller/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamScreen extends GetView<TeamController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(
        init: TeamController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Team Members",
              child: Column(children: [
                Expanded(
                  child: InnerPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Team Members",
                                style: AppTextstyle.text10.copyWith(
                                    fontSize: FontSizeManager.getFontSize(
                                        context, 18),
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold)),
                            SmallButton(
                                name: "Add Team",
                                textColor: AppColors.whiteColor,
                                backcolor: AppColors.secondaryColor,
                                onclick: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddTeamDailog());
                                })
                          ],
                        ),
                        height18,
                        Expanded(
                          child: Obx(
                            () => (controller.teams.isEmpty)
                                ? Center(
                                    child: Text(
                                      "No Teams Found!",
                                      style: AppTextstyle.text10.copyWith(
                                        fontSize: FontSizeManager.getFontSize(
                                            context, 14),
                                        color: AppColors.backColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        controller
                                            .teams.length, // Null check added
                                        (index) {
                                          final team = controller.teams[index];
                                          return InkWell(
                                            onTap: () {},
                                            child: CustomContainer(
                                              borderColor: AppColors.backColor,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              backColor: AppColors.whiteColor,
                                              child: InnerPadding(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              team.name ??
                                                                  "No Name",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        13),
                                                                color: AppColors
                                                                    .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              team.description ??
                                                                  "No Description",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        12),
                                                                color: AppColors
                                                                    .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        IconButton(
                                                          onPressed: () async {
                                                            Get.dialog(AddWorkerDailog(
                                                                teamData: controller
                                                                        .teams[
                                                                    index]));
                                                          },
                                                          icon: Icon(
                                                              Icons
                                                                  .add_circle_outline_rounded,
                                                              color: AppColors
                                                                  .secondaryColor),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .deleteteam(
                                                                    team.id);
                                                          },
                                                          icon: Icon(
                                                              Icons.delete,
                                                              color: AppColors
                                                                  .errorColor),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            controller
                                                                    .descController
                                                                    .text =
                                                                controller
                                                                    .teams[
                                                                        index]
                                                                    .description
                                                                    .toString();
                                                            controller
                                                                    .nameController
                                                                    .text =
                                                                controller
                                                                    .teams[
                                                                        index]
                                                                    .name
                                                                    .toString();
                                                            Get.dialog(AddTeamDailog(
                                                                teamData: controller
                                                                        .teams[
                                                                    index]));
                                                          },
                                                          icon: Icon(Icons.edit,
                                                              color: AppColors
                                                                  .secondaryColor),
                                                        ),
                                                      ],
                                                    ),

                                                    // if(controller
                                                    //         .tasksList[index]
                                                    //         .project != null)...[
                                                    // __row(
                                                    //     context: context,
                                                    //     text: "Project Name: ",
                                                    //     status: controller
                                                    //         .tasksList[index]
                                                    //         .project!
                                                    //         .name
                                                    //          ?? "Loading..."),
                                                    height6,
                                                    __row(
                                                        context: context,
                                                        text: "Status: ",
                                                        status: "In_Progress"),
                                                    height6,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ));
  }
}

Widget __row({text, status, context}) {
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
