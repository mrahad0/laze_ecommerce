


import 'package:e_commerce/Views/pages/Home/chooseBrand_Screen.dart';
import 'package:e_commerce/Views/pages/MainScreen/main_Screen.dart';
import 'package:get/get.dart';
import '../Views/pages/Authentication/ForgotPassScreen.dart';
import '../Views/pages/Authentication/LoginScreen.dart';
import '../Views/pages/Authentication/NewPassScreen.dart';
import '../Views/pages/Authentication/OTPScreen.dart';
import '../Views/pages/Authentication/SignUpScreen.dart';
import '../Views/pages/Authentication/SplashScreen.dart';
import '../Views/pages/Drawer/DrawerScreen.dart';
import '../Views/pages/Home/home_Screen.dart';
import '../Views/pages/PaymentCard/payment_Card.dart';
import '../Views/pages/Setting/AboutUsScreen.dart';
import '../Views/pages/Setting/PrivacyPolicyScreen.dart';
import '../Views/pages/Setting/SettingScreen.dart';
import '../Views/pages/Setting/TermsOfServiceScreen.dart';




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
  static String mainScreen="/main_screen";
  static String brandListScreen = "/brandList_Screen";
  static String paymentCard = "/payment_Card";




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
  GetPage(name: Routes.mainScreen, page:()=> MainScreen()),
  GetPage(name: Routes.brandListScreen, page: () => BrandListScreen(brandLogoPath: Get.arguments,),),
  GetPage(name: Routes.paymentCard, page: () => PaymentCard()),

];
