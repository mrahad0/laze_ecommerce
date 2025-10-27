import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/color.dart';
import '../../../controllers/auth_controller.dart';
import '../../base/custom_textfromfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userCtrl=TextEditingController();
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
                    SizedBox(height: 60),
                    Center(
                      child: Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Please enter your data to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CustomColors.greyColor),
                    ),
                    SizedBox(height: 164),
                    CustomTextFromField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username is required!";
                        }
                        return null;
                      },
                      controller: _userCtrl,
                      hintText: "Enter your username",
                      hintStyle: TextStyle(color: CustomColors.greyColor),
                      labelText: "Username",


                    ),
                    SizedBox(height: 10,),

                    CustomTextFromField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      controller: _passCtrl,
                      obscureText: true,
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: CustomColors.greyColor),
                      labelText: "Password",
                    ),

                    SizedBox(height: 30,),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/forgotpass_Screen');
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    SizedBox(height:40 ,),

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

                     Obx(()=>CustomButton(
                       title: "Login",
                       isLoading: _authController.isLoading.value,
                       onpress: (){
                         if (_formKey.currentState!.validate()){
                           _authController.login(_userCtrl.text.trim(), _passCtrl.text);
                         }
                       },),
                     ),

                    SizedBox(height: 20,),

                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                          text: "If you haven't account ",
                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),
                              recognizer: TapGestureRecognizer()..onTap =(){
                                Get.toNamed("/signUp_screen");
                              },
                            )
                          ],

                        ),

                      ),
                    ),
                  ],
                ),
              ),
           ),
      )
    );
  }

}
