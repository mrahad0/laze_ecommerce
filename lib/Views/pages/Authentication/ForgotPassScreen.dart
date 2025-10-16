import 'package:e_commerce/Utils/color.dart';
import 'package:e_commerce/Views/base/custom_textfromfield.dart';
import 'package:e_commerce/Views/pages/Authentication/OTPScreen.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotpassScreen extends StatelessWidget {
   ForgotpassScreen({super.key});

   TextEditingController _emailCtrl=TextEditingController();

   final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
                child: SingleChildScrollView(
                 child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(Icons.arrow_back, color: Colors.black),
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
                              controller: _emailCtrl,
                              obscureText: true,
                              hintText: "Enter your email",
                              labelText: "Email",
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

                            ElevatedButton(
                                onPressed: (){
                                 Get.to(OTPScreen());
                                },
                                child: Text("Confirm Mail",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                     )
                 ),
                )
            );
      }
  }

