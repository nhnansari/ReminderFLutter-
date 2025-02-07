
import 'package:admin/app/screens/dashboard/components/overview.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                Overview(),
                // SizedBox(height: 16),
                // RecentFiles(),
                // if (Responsive.isMobile(context)) SizedBox(height: 16),
                // if (Responsive.isMobile(context)) StorageDetails(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
