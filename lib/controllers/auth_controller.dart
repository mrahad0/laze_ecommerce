import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/app_constants.dart';
import '../Routes/routes.dart';
import '../helpers/prefs_helpers.dart';

class AuthController extends GetxController {
 RxBool isRememberMe = false.obs;
 var isLoading = false.obs;

    onRememberMeChanged(value) {
    isRememberMe.value = value;
    update();
  }

  /// <================  Otp Verification Screen ======>

  RxInt secondsRemaining = 30.obs; // initial timer seconds
  RxBool enableResend = false.obs;
  Timer? timer;

  dispostTimer(){
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResend.value = false;
  }


  void startTimer() {
    timer?.cancel(); // stop previous timer if any
    secondsRemaining.value = 30;
    enableResend.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        timer.cancel();
      }
    });
  }
 //===========================> Login Screen <========================

 login(String userName, password) async {
   isLoading(true);
   var headers = {'Content-Type': 'application/json'};
   var response = await ApiClient.postData(
     ApiConstant.login,
     jsonEncode({"username":userName , "password": password}),
     headers: headers,
   );
   if (response.statusCode == 200) {
     await PrefsHelper.setString(
       AppConstants.bearerToken,
       response.body['access'],
     );
     Get.offAllNamed(Routes.mainScreen);
   } else {
     ApiChecker.checkApi(response);
   }
   isLoading(false);
 }

 //===========================> SignUp Screen <========================

 signUp(String firstName, email, userName, password) async {
   isLoading(true);

   var headers = {'Content-Type': 'application/json'};
   var response = await ApiClient.postData(
     ApiConstant.signup,
     jsonEncode({"first_name":firstName, "email":email, "username":userName , "password": password}),
     headers: headers,
   );
   if (response.statusCode == 200) {
     await PrefsHelper.setString(
       AppConstants.bearerToken,
       response.body['access'],
     );
     Get.offAllNamed(Routes.mainScreen);
   } else {
     ApiChecker.checkApi(response);
   }
   isLoading(false);
 }

//===========================> Forgot Password Screen <========================

  forgetpassword(String username) async {
    isLoading(true);

    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.forgetpassword,
      jsonEncode({"username":username}),
      headers: headers,
    );
    if (response.statusCode == 200) {

      Get.offAllNamed(Routes.otpScreen,arguments: username);

    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

//===========================> OTP Screen <========================

  otpverify(String otp,userName ) async {
    isLoading(true);

    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.otp(userName),
      jsonEncode({"otp":otp}),
      headers: headers,
    );
    if (response.statusCode == 200) {

      Get.offAllNamed(Routes.newPassScreen,arguments: response.body['access']);

    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

 //////===========================> Reset Password Screen <========================

  reset_password(String newpassword, refreshToken) async {
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $refreshToken'
    };
    var response = await ApiClient.postData(
      ApiConstant.reset_password,
      jsonEncode(
          {
            "new_password":newpassword,
          }
      ),
      headers: headers ,
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

//////===========================> Account Information Screen<========================




}