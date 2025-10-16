import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool isRememberMe=false.obs;

  onRememberMeChanged(bool value){
    isRememberMe.value=value;
    update();
  }
      }