import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppAssets.dart';
import 'package:login_signup_demo/configs/AppConsts.dart';
import 'package:login_signup_demo/extension/stringext.dart';

import '../configs/AppColors.dart';
import '../configs/AppString.dart';
import '../controllers/login_controller.dart';
import '../elements/ButtonWidget.dart';
import '../elements/ContentText.dart';
import '../elements/TextFormFieldBorder.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().colorWhite,
        body: Form(
          key: loginController.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(
                    8.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                          child: Image.asset(
                        AppAssets.app_icon,
                        fit: BoxFit.cover,
                        height: 22.h,
                      )),
                      SizedBox(height: 5.h),
                      TextFormFieldBorder(
                        validator: (value) => value!.validateEmail(value),
                        textCapitalization: TextCapitalization.none,
                        textAlign: TextAlign.start,
                        input_type: TextInputType.emailAddress,
                        hint_text: AppString.enter_email_address.tr,
                        onChanged: (value) {},
                        controller: loginController.emailController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormFieldBorder(
                        validator: (value) => value!.validatePassword(value),
                        textCapitalization: TextCapitalization.none,
                        input_type: TextInputType.visiblePassword,
                        input_action: TextInputAction.done,
                        hint_text: AppString.enter_your_password.tr,
                        onChanged: (value) {},
                        controller: loginController.passwordController,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ContentText(
                          text: AppString.forgot_password,
                          color: Colors.blue,
                          maxLine: 1,
                          textSize: 3.5.w,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ButtonWidget(
                          color: AppColors().colorWhite,
                          bkg_color: AppColors().colorBlue,
                          text: AppString.sign_in.tr,
                          onPressed: () {
                            if(loginController.formKey.currentState!.validate()){
                              Get.offAndToNamed(Routes.HomeScreen);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: ContentTextSize.w,
                                color: AppColors().colorLightText),
                            children: [
                              TextSpan(
                                text: AppString.dont_have_an_account.tr,
                              ),
                              TextSpan(
                                text: AppString.sign_up.tr,
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAndToNamed(Routes.SignupScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
