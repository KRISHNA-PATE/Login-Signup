import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AppColors.dart';

const DEBUG = false;

class Debug {
  static void setLog(String msg) {
    // if (DEBUG) print(msg);
    log(msg);
  }
}

double ContentTextSize = 4;
double ContentMediumTextSize = 4.5;
double TitleTextSize = 5;
double TitleBigTextSize = 6;

Widget showLoadingProgressBar(height) {
  return SafeArea(
    child: Container(
      height: height,
      color: AppColors().colorWhite,
      child: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(
              color: AppColors().colorBlue,
            ),
          ),
        ],
      ),
    ),
  );
}

getSystemSizeKw(double size) {
  return (size * 1000);
}
/*extension SizeExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => */ /*this * Get.width >= 600 ? this * Get.height / 130 :*/ /* this * Get.height / 100;


  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => */ /*this * Get.width >= 600 ? this * Get.width / 130 : */ /*this * Get.width / 100;

}*/

extension SizeExt on num {
  double get h => this * Get.height / 100;

  double get w => this * Get.width / 100;
}
