import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppAssets.dart';
import 'package:login_signup_demo/configs/AppConsts.dart';

import '../configs/AppColors.dart';
import '../configs/AppString.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColors().colorWhite,
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppString.app_name.tr),
        ),
        body: Container(
          padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        ),
        floatingActionButton: Obx(() => InkWell(
              child: Image.asset(
                AppAssets.add_floating,
                width: 15.w,
              ),
              onTap: () async {},
            )),
      ),
    );
  }
}
