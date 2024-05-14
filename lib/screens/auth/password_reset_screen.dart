import 'package:auth/screens/auth/widgets/global_text_button.dart';
import 'package:auth/screens/auth/widgets/global_text_field.dart';
import 'package:auth/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_style.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Icon(Icons.lock, size: width / 3, color: AppColors.c130160),
              SizedBox(height: 36.h),
              Text('Forgot Password', style: AppTextStyle.sansSemiBold),
              SizedBox(height: 26.h),
              Text(
                  'Provide your email and we will send you a link to reset your password',
                  style: AppTextStyle.interLight.copyWith(fontSize: 18)),
              SizedBox(height: 20.h),
              GlobalTextField(
                keyboardType: TextInputType.emailAddress,
                inputFormatter: const [],
                formKey: _formKey,
                validateEmptyText: 'Enter email',
                validateText: 'Incorrect email',
                validate: AppConstants.emailRegExp,
                title: 'Email',
                icon: const Icon(Icons.email),
                controller: emailController,
              ),
              SizedBox(height: 30.h),
              GlobalTextButton(
                onTap: () {
                  final isValidate = _formKey.currentState!.validate();
                  if(isValidate){
                    // TODO reset password
                  }
                },
                text: 'Reset',
              ),
              SizedBox(height: 13.h),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Go Back',
                  style: AppTextStyle.interMedium.copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
