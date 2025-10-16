import 'package:e_commerce/Views/pages/LoginOrSignUpScreens/NewPassScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Utils/color.dart';

class OTPScreen extends StatelessWidget {
   OTPScreen({super.key});
  final List<TextEditingController> _otpControllers =
  List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

                  SizedBox(height: 80),

                  // OTP Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 60,
                        height: 65,
                        child: TextField(
                          controller: _otpControllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Color(0xFFE5E5E5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.deepPurple),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 80),

                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "00:20 ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "resend confirmation code.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed('/newPass_screen');
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
                ]
            ),
        ),
      )),
    );
  }
}
