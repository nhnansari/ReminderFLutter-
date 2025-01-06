// import 'package:ebp_flutter/app/routes/app_routes.dart';
// import 'package:ebp_flutter/app/screens/root/controller/root_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RootScreen extends GetView<RootController> {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   RootScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetX<RootController>(
//         init: RootController(),
//         builder: (_) {
//           // Get current route
          

//           return Scaffold(
//             key: scaffoldKey,
//             resizeToAvoidBottomInset: false,
//             body: Navigator(
//               key: navigatorKey,
//             ),
//           );
//         });
//   }
// }