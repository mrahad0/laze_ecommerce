import 'package:e_commerce/Views/pages/DrawerScreens/DrawerScreen.dart';
import 'package:e_commerce/Views/pages/HomeScreens/HomeScreen.dart';
import 'package:e_commerce/Views/pages/SettingScreens/PrivacyPolicyScreen.dart';
import 'package:e_commerce/Views/pages/SettingScreens/TermsOfServiceScreen.dart';
import 'package:get/get.dart';
import '../Views/pages/SettingScreens/AboutUsScreen.dart';
import '../Views/pages/SettingScreens/SettingScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/ForgotPassScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/LoginScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/NewPassScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/OTPScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/SignUpScreen.dart';
import '../Views/pages/LoginOrSignUpScreens/SplashScreen.dart';



class Routes{
  static String splashScreen="/";
  static String loginScreen="/login_screen";
  static String signUpScreen="/signUp_screen";
  static String forgotpassScreen="/forgotpass_Screen";
  static String otpScreen="/otp_Screen";
  static String newPassScreen="/newPass_screen";
  static String homeScreen= "/home_screen";
  static String drawerScreen= "/drawer_screen";
  static String settingScreen= "/setting_screen";
  static String termsOfService= "/termsOsService_page";
  static String privacyPolicy= "/privacyPolicy_page";
  static String aboutUs= "/aboutUs_page";

}

List<GetPage> pages=[
  GetPage(name: Routes.splashScreen, page: ()=>SplashScreen()),
  GetPage(name: Routes.loginScreen, page: ()=>LoginScreen()),
  GetPage(name: Routes.signUpScreen, page: ()=>SignUpScreen()),
  GetPage(name: Routes.forgotpassScreen, page: ()=>ForgotpassScreen()),
  GetPage(name: Routes.otpScreen, page: ()=>OTPScreen()),
  GetPage(name: Routes.newPassScreen, page: ()=>NewPassScreen()),
  GetPage(name: Routes.homeScreen, page:()=> HomeScreen()),
  GetPage(name: Routes.drawerScreen, page:()=> DrawerScreen()),
  GetPage(name: Routes.settingScreen, page:()=> SettingScreen()),
  GetPage(name: Routes.termsOfService, page:()=> TermsOfServicePage()),
  GetPage(name: Routes.privacyPolicy, page:()=> Privacypolicyscreen()),
  GetPage(name: Routes.aboutUs, page:()=> Aboutusscreen()),
];
