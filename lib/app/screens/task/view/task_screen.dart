// ignore_for_file: unnecessary_null_comparison

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/Custom_container.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/dotted_divider.dart';
import '../../../core/widgets/small_buttom.dart';
import '../components/add_task_dialog.dart';
import '../controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskScreen extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (controller) => Title(
        title: "Task",
        color: AppColors.textColor,
        child: Column(children: [
          Expanded(
            child: InnerPadding(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tasks",
                            style: AppTextstyle.text10.copyWith(
                                fontSize:
                                    FontSizeManager.getFontSize(context, 18),
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold)),
                        controller.isWorker.value == "admin"
                            ? SmallButton(
                                name: "Add Task",
                                textColor: AppColors.whiteColor,
                                backcolor: AppColors.secondaryColor,
                                onclick: () {
                                  controller.clear();
                                  showDialog(
                                      context: context,
                                      builder: (context) => AddTaskDialog());
                                })
                            : SizedBox()
                      ],
                    ),
                    height18,
                    Expanded(
                      child: Obx(
                        () => (controller.tasksList.isEmpty)
                            ? Center(
                                child: Text(
                                  "No Task Found!",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    controller
                                        .tasksList.length, // Null check added
                                    (index) {
                                      final task = controller.tasksList[index];
                                      return task == null
                                          ? SizedBox() // Handle potential null task
                                          : InkWell(
                                              onTap: () {},
                                              child: CustomContainer(
                                                borderColor:
                                                    AppColors.backColor,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                backColor: AppColors.whiteColor,
                                                child: InnerPadding(
                                                  child: Column(
                                                    children: [
                                                      Row(children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                task.name ??
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
                                                                task.description ??
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
                                                        if (controller.isWorker
                                                                .value ==
                                                            "admin") ...[
                                                          IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .deleteTask(
                                                                      task.id);
                                                            },
                                                            icon: Icon(
                                                                Icons.delete,
                                                                color: AppColors
                                                                    .errorColor),
                                                          ),
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AddTaskDialog(
                                                                    editTask:
                                                                        task,
                                                                    isEdit:
                                                                        true,
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            icon: Icon(
                                                                Icons.edit,
                                                                color: AppColors
                                                                    .secondaryColor),
                                                          ),
                                                        ],
                                                      ]),
                                                      height10,
                                                      if (controller
                                                              .tasksList[index]
                                                              .project !=
                                                          null) ...[
                                                        __row(
                                                            context: context,
                                                            text:
                                                                "Project Name: ",
                                                            status: controller
                                                                    .tasksList[
                                                                        index]
                                                                    .project!
                                                                    .name ??
                                                                "Loading..."),
                                                        height6,
                                                        __row(
                                                            context: context,
                                                            text: "Status: ",
                                                            status:
                                                                "In_Progress"),
                                                        height6,
                                                        __row(
                                                          context: context,
                                                          text: "Create Date:",
                                                          status: controller
                                                              .tasksList[index]
                                                              .createdAt!
                                                              .split("T")[0]
                                                              .toString(),
                                                        ),
                                                        height6,
                                                        __row(
                                                          context: context,
                                                          text: "End Date:",
                                                          status: controller
                                                              .tasksList[index]
                                                              .dueDate!
                                                              .split("T")[0]
                                                              .toString(),
                                                        ),
                                                      ],
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
        ]),
      ),
    );
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
