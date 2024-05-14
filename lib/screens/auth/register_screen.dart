import 'package:auth/screens/auth/widgets/global_password_field.dart';
import 'package:auth/screens/auth/widgets/global_text_button.dart';
import 'package:auth/screens/auth/widgets/global_text_field.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/formatters/app_formatters.dart';
import '../../utils/images/app_images.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();
  final _formKeyFour = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Checkbox value
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.cF9F9F9,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 72.h, left: 29.w, right: 29.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Create an Account',
                    style: AppTextStyle.sansBold.copyWith(fontSize: 30),
                  ),
                ),
                SizedBox(height: 11.h),
                Center(
                  child: Text(
                    'Please register to use the app',
                    style: AppTextStyle.sansRegular.copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(height: 64.h),
                Text(
                  'Full name',
                  style: AppTextStyle.sansBold.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  keyboardType: TextInputType.text,
                  inputFormatter: const [],
                  title: 'John Doe',
                  icon: const Icon(Icons.person),
                  controller: nameController,
                  validate: AppConstants.textRegExp,
                  validateText: 'Invalid name',
                  validateEmptyText: 'Enter name',
                  formKey: _formKeyOne,
                ),
                SizedBox(height: 14.h),
                Text(
                  'Email',
                  style: AppTextStyle.sansBold.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatter: const [],
                  title: 'example@gmail.com',
                  icon: const Icon(Icons.email),
                  controller: phoneController,
                  validate: AppConstants.emailRegExp,
                  validateText: 'Invalid email',
                  validateEmptyText: 'Enter email',
                  formKey: _formKeyTwo,
                ),
                SizedBox(height: 14.h),
                Text(
                  'Phone',
                  style: AppTextStyle.sansBold.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  keyboardType: TextInputType.phone,
                  inputFormatter: [AppInputFormatters.phoneFormatter],
                  title: '99 123 45 67',
                  icon: const Icon(Icons.phone),
                  controller: phoneController,
                  validate: RegExp(r'(["0-9])'),
                  validateText: 'Invalid phone',
                  validateEmptyText: 'Enter phone',
                  formKey: _formKeyThree,
                ),
                SizedBox(height: 14.h),
                Text(
                  'Password',
                  style: AppTextStyle.sansBold.copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalPasswordField(
                  title: '* * * * * *',
                  icon: const Icon(Icons.lock),
                  controller: passwordController,
                  validate: AppConstants.passwordRegExp,
                  formKey: _formKeyFour,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.c130160,
                      value: isChecked,
                      onChanged: (v) {
                        setState(() {
                          isChecked = v!;
                        });
                      },
                    ),
                    Text(
                      'Remember me',
                      style: AppTextStyle.sansRegular
                          .copyWith(fontSize: 12, color: AppColors.cAAA6B9),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteNames.passwordResetRoute);
                      },
                      child: Text(
                        'Forgot password?',
                        style: AppTextStyle.sansRegular.copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: GlobalTextButton(
                    onTap: () {
                      final isValidateOne =
                          _formKeyOne.currentState!.validate();
                      final isValidateTwo =
                          _formKeyTwo.currentState!.validate();
                      final isValidateThree =
                          _formKeyThree.currentState!.validate();
                      final isValidateFour =
                          _formKeyFour.currentState!.validate();
                      if (isValidateOne &&
                          isValidateTwo &&
                          isValidateThree &&
                          isValidateFour) {
                        // +998 99 123 45 67 to 998991234567
                        // String cleanedPhone =
                        //     phoneController.text.replaceAll(RegExp(r'\D+'), '');
                      }
                    },
                    text: 'SIGN UP',
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.cD6CDFE,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.google, height: 20.h),
                          SizedBox(width: 10.w),
                          Text(
                            'SIGN UP WITH GOOGLE',
                            style: AppTextStyle.sansBold
                                .copyWith(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have already an account",
                      style: AppTextStyle.sansRegular
                          .copyWith(fontSize: 12, color: AppColors.c524B6B),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouteNames.loginRoute);
                      },
                      child: Text(
                        'Sign in',
                        style: AppTextStyle.sansRegular
                            .copyWith(fontSize: 12, color: AppColors.cFF9228),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
