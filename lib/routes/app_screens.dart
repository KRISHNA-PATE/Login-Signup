import 'package:get/get.dart';
import 'package:login_signup_demo/screens/signup_screen.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import 'app_routes.dart';

class AppScreens {
  static final screens = [
    GetPage(name: Routes.Splash, page: () => SplashScreen()),
    GetPage(name: Routes.LoginScreen, page: () => LoginScreen()),
    GetPage(name: Routes.SignupScreen, page: () => SignUPScreen()),
    GetPage(name: Routes.HomeScreen, page: () => HomeScreen()),
  ];
}
