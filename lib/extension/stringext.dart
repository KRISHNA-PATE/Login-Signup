import 'package:get/get.dart';
import 'package:login_signup_demo/configs/AppString.dart';

extension extString on String {
  String? validateName(String value) {
    if (value.isEmpty) {
      return AppString.please_enter_your_name.tr;
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty || !emailRegExp.hasMatch(value)) {
      return AppString.enter_valid_email_address.tr;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty || !regex.hasMatch(value)) {
      return AppString.enter_valid_password.tr;
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return AppString.enter_valid_password.tr;
    } else {
      if (value.trim() != password.trim()) {
        return AppString.password_not_match.tr;
      } else {
        return null;
      }
    }
  }
}
