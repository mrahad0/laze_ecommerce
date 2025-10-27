import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../Data/utils/app_constants.dart';
import '../../../Utils/color.dart';
import '../../../helpers/prefs_helpers.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jumToNextPage();
    super.initState();
  }

  jumToNextPage() {
    Future.delayed(Duration(seconds: 3), ()async {
      var token = await PrefsHelper.getString(AppConstants.bearerToken);
      debugPrint("issue token : $token");
      if(token.isNotEmpty) {
        Get.offAllNamed(Routes.mainScreen);//   Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }else {
        Get.offAllNamed(Routes.loginScreen);
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Center(child: SvgPicture.asset("assets/icons/logo.svg")),
    );
  }
}