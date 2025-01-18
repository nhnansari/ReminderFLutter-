// import 'package:admin/app/api/api_preference.dart';
// import 'package:admin/app/controllers/MenuAppController.dart';
// import 'package:admin/app/core/assets/app_images.dart';
// import 'package:admin/app/core/utils/app_colors.dart';
// import 'package:admin/app/core/utils/app_textstyle.dart';
// import 'package:admin/app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomDrawer extends StatelessWidget {
//   final controller = Get.put(MenuAppController());
//   CustomDrawer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppColors.whiteColor,
//       child: ListView(
//         children: [
//           DrawerHeader(
//             child: Image.asset(
//               AppImages.logo,
//             ),
//           ),
//           DrawerListTile(
//             title: "Profile",
//             iconPath: Icons.person_3,
//             press: () => controller.changeIndex(0),
//           ),
//           DrawerListTile(
//             title: "Subscriptions",
//             iconPath: Icons.subscriptions,
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Switch Company",
//             iconPath: Icons.swap_vert,
//             press: () {
//               Get.offAllNamed(AppRoutes.companies);
//             },
//           ),
//           DrawerListTile(
//             title: "Logout",
//             iconPath: Icons.logout,
//             press: () async {
             
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile({
//     Key? key,
//     // For selecting those three line once press "Command+D"
//     required this.title,
//     required this.iconPath,
//     required this.press,
//   }) : super(key: key);

//   final String title;
//   final IconData iconPath;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: press,
//       child: ListTile(
//         horizontalTitleGap: 0.0,
//         leading: Icon(
//           iconPath,
//           size: 18,
//           color: AppColors.primaryColor,
//         ),

        
//         title: Text(
//           " $title",
//           style: AppTextstyle.text10.copyWith(
//               fontSize: FontSizeManager.getFontSize(context, 13),
//               color: AppColors.textColor,
//               fontWeight: FontWeight.normal),
//         ),
//       ),
//     );
//   }
// }
