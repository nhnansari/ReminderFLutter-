import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/screens/reset_password/view/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Title(
      title: 'Reset Password | Earn Big Profits',
      color: AppColors.textColor,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: ResetPasswordScreen(),)
      ),
    );
  }
}
