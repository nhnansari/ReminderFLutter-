import '../../../core/utils/app_colors.dart';
import '../components/overview.dart';
import '../controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Title(
            title: "Dashboard",
            color: AppColors.textColor,
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Overview(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
