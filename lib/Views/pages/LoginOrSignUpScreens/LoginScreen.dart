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
                    controller: _emailCtrl,
                    hintText: "Enter your email",
                    labelText: "Email",

                  ),
                  SizedBox(height: 10,),

                  CustomTextFromField(
                    controller: _passCtrl,
                    obscureText: true,
                    hintText: "Enter your password",
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

                  SizedBox(height: 20,),

                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed('/home_screen');
                      },
                      child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),
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
         )
    );
  }

}
