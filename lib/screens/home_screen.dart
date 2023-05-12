import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppAssets.dart';
import 'package:login_signup_demo/configs/AppConsts.dart';

import '../configs/AppColors.dart';
import '../configs/AppString.dart';
import '../controllers/home_controller.dart';
import '../elements/ContentText.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors().colorWhite,
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppString.app_name.tr),
        actions:   [
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(Routes.LoginScreen);
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon( Icons.logout_outlined,size: 30,)),
          ),
        ],
      ),
      body: Center(
        child: ContentText(
          alignment: TextAlign.center,
          text: AppString.welcome.tr,
          color: Colors.grey,
          maxLine: 1,
        ),
      ),
      floatingActionButton:  InkWell(
        child: Image.asset(
          AppAssets.add_floating,
          width: 15.w,
        ),
        onTap: () async {},
      ),
    );
  }
}
