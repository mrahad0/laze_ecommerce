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
  TextEditingController _userCtrl=TextEditingController();
  TextEditingController _emailCtrl=TextEditingController();
  TextEditingController _passCtrl=TextEditingController();

  final AuthController _authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
                      controller: _userCtrl,
                      hintText: "Enter username",
                      labelText: "Username",

                    ),

                    SizedBox(height: 10,),

                    CustomTextFromField(
                      controller: _passCtrl,
                      obscureText: true,
                      hintText: "Enter your password",
                      labelText: "Password",

                    ),
                    SizedBox(height: 10,),

                    CustomTextFromField(
                      controller: _emailCtrl,
                      obscureText: true,
                      hintText: "Enter your email",
                      labelText: "Email",
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
                          value: _authController.isRememberMe.value,
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

                    ElevatedButton(
                        onPressed: (){
                        },
                        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          minimumSize:Size(double.infinity, 50),
                          backgroundColor: CustomColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
           );
      }

  }
