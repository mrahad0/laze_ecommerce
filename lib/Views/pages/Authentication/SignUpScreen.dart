import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/color.dart';
import '../../../controllers/auth_controller.dart';
import '../../base/custom_textfromfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  TextEditingController _nameCtrl=TextEditingController();
  TextEditingController _userCtrl=TextEditingController();
  TextEditingController _emailCtrl=TextEditingController();
  TextEditingController _passCtrl=TextEditingController();

  final AuthController _authController = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: _formKey,
        child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 60),
                      Center(
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),

                      SizedBox(height: 164),
                      CustomTextFromField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter first name";
                          }
                          return null;
                        },
                        controller: _nameCtrl,
                        hintText: "Enter first name",
                        hintStyle: TextStyle(color: CustomColors.greyColor),
                        labelText: "First Name",

                      ),

                      SizedBox(height: 10,),

                      CustomTextFromField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required!";
                          }
                          return null;
                        },
                        controller: _emailCtrl,
                        obscureText: false,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: CustomColors.greyColor),
                        labelText: "Email",
                      ),

                      SizedBox(height: 10,),

                      CustomTextFromField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required!";
                          }
                          return null;
                        },
                        controller: _userCtrl,
                        obscureText: false,
                        hintText: "Enter your username",
                        hintStyle: TextStyle(color: CustomColors.greyColor),
                        labelText: "Username",
                      ),

                      SizedBox(height: 10,),

                      CustomTextFromField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter Password";
                          }
                          return null;
                        },
                        controller: _passCtrl,
                        obscureText: true,
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: CustomColors.greyColor),
                        labelText: "Password",

                      ),

                      SizedBox(height:70 ,),

                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 16),
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: Get.find<AuthController>().isRememberMe.value,
                            onChanged: _authController.onRememberMeChanged,
                          ),
                        ],
                      )),
                      SizedBox(height: 60,),

                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text:TextSpan(
                            text: "If you have account? ",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),
                                recognizer: TapGestureRecognizer()..onTap =(){
                                  Get.toNamed('/login_screen');
                                  },
                              )
                            ],

                          ),

                        ),
                      ),

                      SizedBox(height: 20,),

                      Obx(()
                        => CustomButton(
                          title: "Sign Up",
                          isLoading: _authController.isLoading.value,
                          onpress: (){
                            if(_formKey.currentState!.validate()){
                              _authController.signUp(_nameCtrl.text, _emailCtrl.text, _userCtrl.text, _passCtrl.text);
                            };
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
           );
      }

  }
