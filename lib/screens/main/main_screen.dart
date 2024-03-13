import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      appBar: PreferredSize(
        child: Header(),
        preferredSize: Size.fromHeight(60),
      ),
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Consumer<MenuAppController>(
              builder: (BuildContext context, MenuAppController value,
                      Widget? child) =>
                  Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: value.selectedIndex == 0
                    ? DashboardScreen()
                    : RecentFiles(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
