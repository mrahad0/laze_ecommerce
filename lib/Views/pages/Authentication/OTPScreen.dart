import 'dart:convert';

import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:e_commerce/Utils/color.dart';
import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/helpers/time_formetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../Data/services/api_client.dart';
import '../../../Data/services/api_constant.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  AuthController _authController = Get.find<AuthController>();

  TextEditingController _pinPutController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _authController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _authController.dispostTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                      "OTP Verification",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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

                  SizedBox(height: 80),

                  Center(
                    child: Obx(
                          () => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Pinput(
                            controller: _pinPutController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the OTP code";
                              }
                              if (value.length < 6) {
                                return "Enter a valid code";
                              }
                              return null;
                            },
                            length: 6,
                          ),
                          SizedBox(height: 166),
                          _authController.enableResend.value
                              ? TextButton(
                            onPressed: () async{
                              _authController.startTimer();

                              _authController.isLoading(true);

                                var headers = {'Content-Type': 'application/json'};
                                var response = await ApiClient.postData(
                                  ApiConstant.forgetpassword,
                                  jsonEncode({"username":Get.arguments}),
                                  headers: headers,
                                );
                                if(response.statusCode != 200){
                                  ApiChecker.checkApi(response);
                                }
                              _authController.isLoading(false);



                            },
                            child: Text("Resend Code"),
                          )
                              : RichText(
                            text: TextSpan(
                              text: formatTime(
                                _authController.secondsRemaining.value,
                              ),
                              style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: " resend confirmation code.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 40,),

                          Obx(()
                            =>CustomButton(
                              title:"Confirm Code",
                              isLoading: _authController.isLoading.value,
                              onpress: () {
                                if (_formKey.currentState!.validate()) {
                                  _authController.otpverify(_pinPutController.text,Get.arguments);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
