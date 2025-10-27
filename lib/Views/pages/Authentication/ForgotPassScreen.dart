import 'package:e_commerce/Utils/color.dart';
import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:e_commerce/Views/base/custom_textfromfield.dart';
import 'package:e_commerce/Views/pages/Authentication/OTPScreen.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotpassScreen extends StatelessWidget {
   ForgotpassScreen({super.key});

   TextEditingController _userCtrl=TextEditingController();

   final AuthController _authController = Get.put(AuthController());

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: _formKey,
        child: SafeArea(
                  child: SingleChildScrollView(
                   child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(Icons.arrow_back, color: Colors.black),
                                ),
                              ),

                              SizedBox(height: 40),

                              Center(
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              SizedBox(height: 30),

                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/Object.svg",
                                  width: 225,
                                  height: 166,
                                ),
                              ),

                              SizedBox(height: 40),

                              CustomTextFromField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Username is required!";
                                  }
                                  return null; // সব ঠিক থাকলে
                                },
                                controller: _userCtrl,
                                obscureText: false,
                                hintText: "Enter your Username",
                                hintStyle: TextStyle(color: CustomColors.greyColor),
                                labelText: "Username",
                              ),

                              SizedBox(height: 130),

                              Text(
                                "Please write your email to receive a confirmation code to set a new password.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: 20,),

                              Obx(()
                                => CustomButton(
                                  title: "Confirm Username",
                                  isLoading: _authController.isLoading.value,
                                  onpress: (){
                                  if(_formKey.currentState!.validate()){
                                    _authController.forgetpassword(_userCtrl.text);
                                  }
                                },),
                              )

                            ],
                          ),
                       )
                   ),
                  ),
      )
            );
      }
  }

