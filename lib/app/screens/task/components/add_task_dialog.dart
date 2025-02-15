import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/utils/app_textstyle.dart';
import '../../../core/widgets/InnerPadding.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/small_buttom.dart';
import '../../../responsive.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTaskDialog extends StatelessWidget {
  final controller = Get.put(TaskController());
  final bool isEdit;
  final TasksModelData? editTask;
  final formkey = GlobalKey<FormState>();
  AddTaskDialog({super.key, this.isEdit = false, this.editTask});

  @override
  Widget build(BuildContext context) {
    editTask != null ? controller.editTask(editTask!) : null;
    return AlertDialog(
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isEdit ? "Edit Task" : "Add Task",
                        style: AppTextstyle.text10.copyWith(
                            fontSize: FontSizeManager.getFontSize(context, 14),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold)),
                    isEdit
                        ? Text("Create a new Task",
                            style: AppTextstyle.text10.copyWith(
                              fontSize:
                                  FontSizeManager.getFontSize(context, 12),
                              color: AppColors.greyColor,
                            ))
                        : const SizedBox(),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.greyColor,
                    ))
              ],
            ),
            height10,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              title: "Name",
              hinttext: "Enter Name",
              iconPath: Icons.person,
              controller: controller.nameController,
              validator: (v) => v?.isEmpty ?? true ? "Name is required" : null,
            ),
            height10,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              title: "Discription",
              hinttext: "Enter discription",
              iconPath: Icons.person,
              controller: controller.descController,
              validator: (v) =>
                  v?.isEmpty ?? true ? "Discription is required" : null,
            ),
            height10,
            projectDropdownField(context: context),
            height10,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              ontap: () {
                controller.pickStartDate(context);
              },
              readonly: true,
              title: "Start Date",
              hinttext: "Enter start date",
              iconPath: Icons.person,
              controller: controller.startDateController,
              validator: (v) => v?.isEmpty ?? true ? "Date is required" : null,
            ),
            height12,
            CustomTextfeild(
              titleColor: AppColors.textColor,
              ontap: () {
                controller.pickEndDate(context);
              },
              title: "End Date",
              readonly: true,
              hinttext: "Enter end date",
              iconPath: Icons.person,
              controller: controller.endDateController,
              validator: (v) => v?.isEmpty ?? true ? "Date is required" : null,
            ),
            height10,
            InnerPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmallButton(
                    name: isEdit ? "Update" : "Add",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.backColor,
                    onclick: () {
                      if (formkey.currentState!.validate()) {
                        // Perform registration logic
                        isEdit
                            ? controller.updateMsg(editTask!.id)
                            : controller.createTask();
                      }
                    },
                  ),
                  VerticalDivider(),
                  SmallButton(
                    name: "Cancel",
                    width: 90,
                    textColor: AppColors.whiteColor,
                    backcolor: AppColors.greyColor,
                    onclick: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget projectDropdownField({context}) {
  // Ensure project list is not null and remove duplicate project names
  List<Map<String, dynamic>> uniqueProjects = controller.projectController.projectList
      .map((e) => {"id": e.id.toString(), "name": e.name.toString()})
      .toSet()
      .toList();

  bool isProjectListEmpty = uniqueProjects.isEmpty;

  return  DropdownButtonFormField<String>(
      hint: Text(
        isProjectListEmpty ? "No Project Found" : "Choose Project",
        textAlign: TextAlign.start,
        style: AppTextstyle.text14.copyWith(
          overflow: TextOverflow.ellipsis,
          fontSize: FontSizeManager.getFontSize(context, 13),
          color: AppColors.whiteColor,
        ),
      ),
      style: AppTextstyle.text10.copyWith(
        color: AppColors.whiteColor,
        fontSize: FontSizeManager.getFontSize(context, 13),
      ),
      value: isProjectListEmpty || controller.selectedProjectId.value.isEmpty
          ? null
          : controller.selectedProjectId.value,
      isExpanded: true,
      items: isProjectListEmpty
          ? []
          : uniqueProjects.map<DropdownMenuItem<String>>((project) {
              return DropdownMenuItem<String>(
                value: project["id"],
                child: Text(
                  project["name"],
                  style: AppTextstyle.text10.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: FontSizeManager.getFontSize(context, 13),
                  ),
                ),
              );
            }).toList(),
      onChanged: isProjectListEmpty
          ? null
          : (String? selectedId) {
              if (selectedId != null) {
                controller.selectedProjectId.value = selectedId;
                print("Selected Project ID: ${controller.selectedProjectId.value}");
              }
            },
      dropdownColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: AppColors.secondaryColor,
        filled: true,
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondaryColor,
          ),
        ),
        errorStyle: AppTextstyle.text12.copyWith(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.errorColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondaryColor,
          ),
        ),
        isCollapsed: Responsive.isMobile(context) ? true : null,
        hintText: isProjectListEmpty ? "No Project Found" : "Choose Project",
        hintStyle: AppTextstyle.text14.copyWith(
          color: AppColors.hintColor,
          fontSize: FontSizeManager.getFontSize(context, 12),
        ),
      
    ),
  );
}}
