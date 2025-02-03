import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/team/controller/team_controller.dart';
import 'package:admin/app/screens/team/model/team_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddWorkerDailog extends StatelessWidget {
  final controller = Get.put(TeamController());
  final TeamData teamData;
  final formkey = GlobalKey<FormState>();
  AddWorkerDailog({super.key, required this.teamData});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formkey,
        child: InnerPadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200.w,
              ),
              // add button

              Text("Add Team Member",
                  style: AppTextstyle.text10.copyWith(
                      fontSize: FontSizeManager.getFontSize(context, 14),
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold)),
              height14,
              worker(context: context),
              height12,
              InnerPadding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SmallButton(
                        name: "Add",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.primaryColor,
                        onclick: () {
                          if (formkey.currentState!.validate()) {
                            controller.addWorker(
                              teamId: teamData.id.toString(),
                              workerId: controller.selectedWorkerID.value,
                            )
                            ;
                          }
                        },
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: SmallButton(
                        name: "Cancel",
                        textColor: AppColors.whiteColor,
                        backcolor: AppColors.greyColor,
                        onclick: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget worker({context}) {
    // Ensure project list is not null and remove duplicate project names
    List<Map<String, dynamic>> workers = controller
        .workerController.companyUsers
        .map(
            (e) => {"id": e.id.toString(), "name": e.user!.fullName.toString()})
        .toSet()
        .toList();

    bool workersEmpty = workers.isEmpty;

    return DropdownButtonFormField<String>(
      hint: Text(
        workersEmpty ? "No Worker Found" : "Choose Worker",
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
      value: workersEmpty || controller.selectedWorkerID.value.isEmpty
          ? null
          : controller.selectedWorkerID.value,
      isExpanded: true,
      items: workersEmpty
          ? []
          : workers.map<DropdownMenuItem<String>>((project) {
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
      onChanged: workersEmpty
          ? null
          : (String? selectedId) {
              if (selectedId != null) {
                controller.selectedWorkerID.value = selectedId;
                print(
                    "Selected Project ID: ${controller.selectedWorkerID.value}");
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
        hintText: workersEmpty ? "No Worker Found" : "Choose Worker",
        hintStyle: AppTextstyle.text14.copyWith(
          color: AppColors.hintColor,
          fontSize: FontSizeManager.getFontSize(context, 12),
        ),
      ),
    );
  }
}
