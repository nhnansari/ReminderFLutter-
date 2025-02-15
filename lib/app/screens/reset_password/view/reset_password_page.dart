import '../../../core/utils/app_colors.dart';
import 'screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Title(
      title: 'Reset Password',
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
