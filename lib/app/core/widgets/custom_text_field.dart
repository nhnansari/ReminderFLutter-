// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class CustomTextfeild extends StatelessWidget {
  final VoidCallback? ontap;
  final Widget? icon, prefix;
  final Widget? prefixwidget;
  final Color bordercolor;
  final bool obscureText;
  final GlobalKey? formkey;
  final String errorText;

  final Color errorcolor;
  final Color errorbordercolor;
  final Color shadowColor;
  final bool filled;
  final Color? focusbordercolor;
  final Color? enablebordercolor, titleColor, textColor;
  final Color iconcolor;
  final Color hintcolor;
  final Color? outlinebordercolor;
  final Color? fillcolor;
  final bool autofocus;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int maxlines;
  final int errormaxlines;
  FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;
  final String? title;
  final bool readonly;
  BoxConstraints? boxConstraints;
  final keyBoardType;
  final String hinttext;
  final IconData? iconPath;
  List<String>? dropdownItems;
  final String? selectedItem;
  final Function(String?)? onDropdownChanged;

  CustomTextfeild({
    super.key,
    this.readonly = false,
    this.enablebordercolor,
    this.boxConstraints,
    this.formkey,
    this.errormaxlines = 1,
    this.keyBoardType,
    this.maxlines = 1,
    this.title,
    this.fillcolor,
    this.bordercolor = AppColors.whiteColor,
    this.errorcolor = AppColors.transparentColor,
    this.errorbordercolor = AppColors.transparentColor,
    this.focusbordercolor,
    this.iconcolor = Colors.white,
    this.autofocus = false,
    this.filled = false,
    this.obscureText = false,
    required this.hinttext,
    this.focusNode,
    this.ontap,
    this.icon,
    this.hintcolor = Colors.white,
    this.shadowColor = AppColors.transparentColor,
    this.controller,
    this.errorText = "",
    this.validator,
    this.prefixwidget,
    this.iconPath,
    this.dropdownItems,
    this.selectedItem,
    this.onDropdownChanged,
    this.titleColor,
    this.prefix,
    this.outlinebordercolor,
    this.inputFormatter,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: unnecessary_null_comparison
        if (title != null)
          Column(
            children: [
              Text(
                title!,
                style: AppTextstyle.text14.copyWith(
                    fontSize: FontSizeManager.getFontSize(context, 13),
                    color: titleColor ?? AppColors.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height / 136,
              ),
            ],
          ),
        dropdownItems != null
            ? DropdownButtonFormField<String>(
                hint: Text(hinttext,
                    textAlign: TextAlign.start,
                    style: AppTextstyle.text14.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: FontSizeManager.getFontSize(context, 13),
                        color: AppColors.hintColor)),
                style: AppTextstyle.text10.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: FontSizeManager.getFontSize(context, 13),
                ),
                value: dropdownItems?.contains(selectedItem) ?? false
                    ? selectedItem
                    : null,
                isExpanded: true,
                validator: validator,
                items: List.generate(
                    dropdownItems!.length,
                    (index) => DropdownMenuItem(
                          value: dropdownItems![index],
                          child: Text(
                            dropdownItems![index],
                            style: AppTextstyle.text10.copyWith(
                              color: AppColors.whiteColor,
                              fontSize:
                                  FontSizeManager.getFontSize(context, 13),
                            ),
                          ),
                        )),
                selectedItemBuilder: (BuildContext context) => List.generate(
                    dropdownItems!.length,
                    (index) => DropdownMenuItem(
                          value: dropdownItems![index],
                          child: Text(
                            dropdownItems![index],
                            style: AppTextstyle.text10.copyWith(
                              color: AppColors.whiteColor,
                              fontSize:
                                  FontSizeManager.getFontSize(context, 13),
                            ),
                          ),
                        )),
                onChanged: onDropdownChanged,
                dropdownColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  fillColor: AppColors.secondaryColor,
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  errorStyle: AppTextstyle.text12.copyWith(color: Colors.red),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.errorColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  prefixIcon: iconPath != null
                      ? Icon(
                          iconPath,
                          color: AppColors.secondaryColor,
                        )
                      : null,
                  // filled: true,
                  // fillColor: fillcolor ?? AppColors.secondaryColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  suffixIcon: icon,
                  isCollapsed: Responsive.isMobile(context) ? true : null,
                  prefix: prefixwidget,
                  hintText: hinttext.tr,
                  prefixIconConstraints: boxConstraints,
                  hintStyle: AppTextstyle.text14.copyWith(
                      color: AppColors.hintColor,
                      fontSize: FontSizeManager.getFontSize(context, 12)),
                ),
              )
            : TextFormField(
                inputFormatters: inputFormatter,
                onTap: ontap,
                readOnly: readonly,
                key: formkey,
                keyboardType: keyBoardType,
                controller: controller,
                cursorColor: Responsive.isDesktop(context)
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                style: AppTextstyle.text10.copyWith(
                    color: focusbordercolor ?? AppColors.blackColor,
                    fontSize: FontSizeManager.getFontSize(context, 13),
                    overflow: TextOverflow.clip),
                obscureText: obscureText,
                focusNode: focusNode,
                validator: validator,
                maxLines: maxlines,
                autofocus: autofocus,
                decoration: InputDecoration(
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 1,
                          color: outlinebordercolor ?? AppColors.secondaryColor,
                        )),
                    errorStyle: AppTextstyle.text12.copyWith(color: Colors.red),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(width: 1, color: Colors.red)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red,
                        )),
                    filled: true,
                    fillColor: fillcolor ?? AppColors.whiteColor,
                    isCollapsed: Responsive.isMobile(context) ? true : null,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.secondaryColor,
                        )),
                    suffixIcon: icon,
                    prefixIcon: iconPath != null
                        ? Icon(
                            iconPath,
                            color: AppColors.secondaryColor,
                          )
                        : null,
                    prefix: prefixwidget,
                    hintText: hinttext.tr,
                    prefixIconConstraints: boxConstraints,
                    hintStyle: AppTextstyle.text14.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: FontSizeManager.getFontSize(context, 13),
                        color: AppColors.hintColor)),
              ),
      ],
    );
  }
}
