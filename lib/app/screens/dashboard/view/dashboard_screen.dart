
import 'package:admin/app/screens/dashboard/components/overview.dart';
import 'package:admin/app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(

      init: DashboardController(),
      builder: (controller) {
        return SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
               Overview(),
              ],
            ),
          ),
        );
      }
    );
  }
}
