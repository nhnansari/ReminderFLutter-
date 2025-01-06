import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/screens/login/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Title(
      title: 'Login',
      color: AppColors.textColor,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: LoginScreen()
        ),
      ),
    );
  }
}
