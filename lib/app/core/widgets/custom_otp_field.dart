
import '../utils/app_colors.dart';
import '../utils/app_textstyle.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController? controller; // External controller passed here
  final String? errorText;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  const CustomPinCodeField({
    super.key,
    this.controller,
    this.onChange,
    this.onSubmitted,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 30.w : 12.w,
      ),
      child: PinCodeTextField(
        validator: validator,
        enablePinAutofill: true,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        appContext: context,
        enableActiveFill: true,
        length: 6,
        textStyle: AppTextstyle.text16
            .copyWith(fontSize: FontSizeManager.getFontSize(context, 14)),
        animationDuration: const Duration(milliseconds: 300),
        animationType: AnimationType.fade,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        autoFocus: true,
        autoDisposeControllers: false,
        
        cursorColor: AppColors.secondaryColor,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller, // Use the external controller here
        pastedTextStyle: AppTextstyle.text16,
        pinTheme: PinTheme(
          disabledColor: AppColors.primaryColor,
          fieldWidth: 45,
          inactiveColor: AppColors.primaryColor,
          inactiveFillColor: AppColors.transparentColor,
          selectedColor: AppColors.primaryColor,
          selectedFillColor: AppColors.transparentColor,
          activeColor: AppColors.primaryColor,
          activeFillColor: AppColors.transparentColor,
          borderRadius: BorderRadius.circular(8.r),
          shape: PinCodeFieldShape.box,
        ),
      ),
    );
  }
}
