import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppAssets.dart';
import 'package:login_signup_demo/extension/stringext.dart';

import '../configs/AppColors.dart';
import '../configs/AppConsts.dart';
import '../configs/AppString.dart';
import '../controllers/signup_controller.dart';
import '../elements/ButtonWidget.dart';
import '../elements/ContentText.dart';
import '../elements/TextFormFieldBorder.dart';
import '../routes/app_routes.dart';

class SignUPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: AppColors().colorWhite,
        body: Form(
          key: signUpController.formKey,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(
                8.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: Image.asset(
                    AppAssets.app_icon,
                    fit: BoxFit.cover,
                    height: 22.h,
                  )),
                  SizedBox(height: 5.h),
                  ContentText(
                    text: AppString.name,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBorder(
                    validator: (val) => val!.validateName(val),
                    input_type: TextInputType.text,
                    hint_text: AppString.enter_your_name.tr,
                    controller: signUpController.nameController,
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  ContentText(
                    text: AppString.email_address.tr,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBorder(
                    validator: (value) => value!.validateEmail(value),
                    input_type: TextInputType.text,
                    hint_text: AppString.enter_email_address.tr,
                    controller: signUpController.emailController,
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  ContentText(
                    text: AppString.password.tr,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBorder(
                    validator: (value) => value!.validatePassword(value),
                    input_type: TextInputType.text,
                    hint_text: AppString.enter_your_password.tr,
                    controller: signUpController.passwordController,
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  ContentText(
                    text: AppString.confirmpassword,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormFieldBorder(
                    validator: (value) => value!.validateConfirmPassword(value,
                        signUpController.passwordController.text.toString()),
                    input_type: TextInputType.text,
                    hint_text: AppString.confirmpassword.tr,
                    onChanged: (value) {},
                    controller: signUpController.confirmPasswordController,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ButtonWidget(
                      color: AppColors().colorWhite,
                      bkg_color: AppColors().colorBlue,
                      text: AppString.sign_up.tr,
                      onPressed: () {
                        if (signUpController.formKey.currentState!.validate()) {
                          Get.offAndToNamed(Routes.HomeScreen);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: ContentTextSize.w,
                            color: AppColors().colorLightText),
                        children: [
                          TextSpan(
                            text: AppString.already_have_account.tr,
                          ),
                          TextSpan(
                            text: AppString.sign_in.tr,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAndToNamed(Routes.LoginScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
