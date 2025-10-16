import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/color.dart';
import '../../base/custom_textfromfield.dart';

class NewPassScreen extends StatelessWidget {
  NewPassScreen({super.key});

  TextEditingController _newPass=TextEditingController();
  TextEditingController _confirmPass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.black),
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
                  controller: _newPass,
                  hintText: "Enter your new password",
                  labelText: "New Password",

                ),
                SizedBox(height: 10,),

                CustomTextFromField(
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

                ElevatedButton(
                    onPressed: (){
                    },
                    child: Text("Reset Password",style: TextStyle(color: Colors.white,fontSize: 20),),
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
