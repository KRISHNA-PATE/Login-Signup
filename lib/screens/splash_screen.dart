import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppAssets.dart';

import '../configs/AppColors.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.LoginScreen);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().colorWhite,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.bg_splash,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Image.asset(
                AppAssets.app_icon,
                height: 180,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}
