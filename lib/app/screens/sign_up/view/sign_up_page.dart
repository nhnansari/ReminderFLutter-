import '../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'screens/sign_up_screen.dart';

class SighnupPage extends StatelessWidget {
  const SighnupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Title(
      title: 'Sign Up',
      color: AppColors.textColor,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SignUpScreen(),
        ),
      ),
    );
  }
}
