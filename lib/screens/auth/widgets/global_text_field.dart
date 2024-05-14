import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_style.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.validate,
    required this.validateText,
    required this.validateEmptyText,
    required this.formKey,
    required this.inputFormatter,
    required this.keyboardType,
  });

  final String title;
  final String validateText;
  final String validateEmptyText;
  final Widget icon;
  final TextEditingController controller;
  final RegExp validate;
  final GlobalKey formKey;
  final List<TextInputFormatter> inputFormatter;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.c99ABC6.withOpacity(0.18),
              blurRadius: 62,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatter,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return validateEmptyText;
            }
            if (!validate.hasMatch(value) || value.length < 3) {
              return validateText;
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.only(top: 17.h, bottom: 17.h),
            prefixIcon: icon,
            hintText: title,
            hintStyle: AppTextStyle.sansRegular.copyWith(
              fontSize: 12,
              color: AppColors.c0D0140.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}