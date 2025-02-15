import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/Custom_container.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/small_buttom.dart';
import '../components/add_project_dailog.dart';
import '../controller/project_controller.dart';
import '../../team/view/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectScreen extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      init: ProjectController(),
      builder: (controller) => Title(
        title: "Projects",
        color: AppColors.textColor,
        child: Column(
          children: [
            Expanded(
              child: InnerPadding(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Projects",
                              style: AppTextstyle.text10.copyWith(
                                  fontSize:
                                      FontSizeManager.getFontSize(context, 18),
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                          controller.isWorker.value == "admin"
                              ? SmallButton(
                                  name: "Add New",
                                  textColor: AppColors.whiteColor,
                                  backcolor: AppColors.secondaryColor,
                                  onclick: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AddProjectDailog());
                                  })
                              : SizedBox()
                        ],
                      ),
                      height18,
                      Expanded(
                        child: Obx(
                          () => (controller.projectList.isEmpty)
                              ? Center(
                                  child: Text(
                                    "No Projets Found!",
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
                                      controller.projectList
                                          .length, // Null check added
                                      (index) {
                                        final projects =
                                            controller.projectList[index];
                                        return InkWell(
                                          onTap: () {},
                                          child: CustomContainer(
                                            borderColor: AppColors.backColor,
                                            margin: EdgeInsets.only(bottom: 10),
                                            backColor: AppColors.whiteColor,
                                            child: InnerPadding(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              projects.name ??
                                                                  "No Name",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        15),
                                                                color: AppColors
                                                                    .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              projects.description ??
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
                                                      ),
                                                      if (controller
                                                              .isWorker.value ==
                                                          "admin") ...[
                                                        IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .deleteProject(
                                                                    projects
                                                                        .id);
                                                          },
                                                          icon: Icon(
                                                              Icons.delete,
                                                              color: AppColors
                                                                  .errorColor),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            controller
                                                                .updateProject(
                                                                    controller
                                                                            .projectList[
                                                                        index]);
                                                            Get.dialog(AddProjectDailog(
                                                                projectListData:
                                                                    controller
                                                                            .projectList[
                                                                        index]));
                                                          },
                                                          icon: Icon(Icons.edit,
                                                              color: AppColors
                                                                  .secondaryColor),
                                                        ),
                                                      ]
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
                                                  row(
                                                      context: context,
                                                      text: "Start Date: ",
                                                      status: projects
                                                          .createdAt!
                                                          .split("T")[0]),
                                                  height6,
                                                  row(
                                                      context: context,
                                                      text: "End Date: ",
                                                      status: projects.endDate!
                                                          .split("T")[0]),
                                                  height6,
                                                  row(
                                                      context: context,
                                                      text: "Status: ",
                                                      status: projects.status ??
                                                          "Loading..."),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
