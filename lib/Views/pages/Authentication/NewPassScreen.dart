import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/color.dart';
import '../../base/custom_textfromfield.dart';

class NewPassScreen extends StatelessWidget {
  NewPassScreen({super.key});

  TextEditingController _newPass=TextEditingController();
  TextEditingController _confirmPass=TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Form(
          key: _formkey,
          child: SafeArea(
            child: SingleChildScrollView(
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
                  SizedBox(height: 60),
                  Center(
                    child: Text(
                      "New Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),

                  SizedBox(height: 164),

                  CustomTextFromField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "New Password is required";
                      }
                      return null;
                    },
                    controller: _newPass,
                    hintText: "Enter your new password",
                    labelText: "New Password",

                  ),
                  SizedBox(height: 10,),

                  CustomTextFromField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Re-Enter Password";
                      }
                      if (value!=_newPass.text){
                        return "Password do not match";
                      }
                    },
                    controller: _confirmPass,
                    obscureText: true,
                    hintText: "Enter your confirm password",
                    labelText: "Confirm Password",
                  ),

                  SizedBox(height: 130,),

                  Text(
                    "Please write your new password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),
                  ),

                  SizedBox(height: 20,),

                 CustomButton(
                   title: "Reset Password",
                   onpress: (){
                     if(_formkey.currentState!.validate()){
                       Get.toNamed("/login_screen");
                     }
                   },)
                ],
              ),
            ),
          ),
        )
    );
  }
}
