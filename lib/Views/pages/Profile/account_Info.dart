import 'package:e_commerce/Routes/routes.dart';
import 'package:e_commerce/Utils/color.dart';
import 'package:e_commerce/controllers/userProfile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Data/services/api_constant.dart';

class AccountInformation extends StatelessWidget {
  AccountInformation({super.key});

  final UserprofileController userProfileController =
  Get.put(UserprofileController());


  @override
  Widget build(BuildContext context) {
    // Fetch profile data when screen is built
    userProfileController.fetchUserInfo();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(()=>
        userProfileController.isProductLoading.value
            ? const Center(child: CircularProgressIndicator())
            : userProfileController.userinfo.isEmpty
            ? const Center(child: Text('No info available'))
            :

        SingleChildScrollView(
          child:
          Column(
            children: [
              // Information fields
              ListView.builder(
                itemCount:  userProfileController.userinfo.length,
                itemBuilder: (context ,index){
                  final item = userProfileController.userinfo[index];
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "${ApiConstant.baseUrl}${item.image}"
                          ),
                          radius: 50,
                        ),
                      ),
                      InfoWidgets(
                        title: "Name",
                        value: '${item.firstName ??""}',
                      ),
                      SizedBox(height: 20,),
                      InfoWidgets(
                          title: "Email",
                          value: '${item.email ??""}'
                      ),

                      SizedBox(height: 20,),


                      InfoWidgets(
                          title: "Phone",
                          value: '${item.phone ??""}'
                      ),

                      SizedBox(height: 20,),


                      InfoWidgets(
                          title: "Country",
                          value: '${item.country ??""}'
                      ),
                      SizedBox(height: 20,),

                      SizedBox(height: 20,),


                      InfoWidgets(
                          title: "City",
                          value: '${item.city ??""} '
                      ),

                      SizedBox(height: 20,),


                      InfoWidgets(
                          title: "Address",
                          value: '${item.address ??""}'
                      )

                    ],
                  );

                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

              ),

              const SizedBox(height: 20),

              // Edit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(width: 2, color: CustomColors.primaryColor),
                  backgroundColor: const Color(0xffF6F2FF),
                  minimumSize: const Size(355, 50),
                ),
                onPressed: () {
                  Get.toNamed(Routes.userEditScreen);
                  // Handle edit button press
                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Edit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

// Helper widget for cleaner UI
/*  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$title:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.7),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }*/


}

class InfoWidgets extends StatelessWidget {
  final String? title;
  final String? value;

  InfoWidgets({super.key,  this.title,  this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        Text(
          value ??"",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}