import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
             children: [
               Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: SvgPicture.asset("assets/icons/Menu (1).svg")
                    ),
                  ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                        child: SvgPicture.asset("assets/images/Zakaria 1.svg",fit: BoxFit.contain,),
                      ),
                    SizedBox(width: 10,),
                    Text(
                      'MD Ahad',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
             ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [

                ListTile(
                  leading:SvgPicture.asset("assets/icons/Info Circle.svg"),
                  title: Text('Account Information',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  onTap: (){},
                ),

                // Order
                ListTile(
                  leading:SvgPicture.asset("assets/icons/Bag.svg"),
                  title: Text('Order',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  onTap: (){},
                ),

                // My Cards
                ListTile(
                  leading:SvgPicture.asset("assets/icons/Wallet.svg"),
                  title: Text('My Card',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  onTap: (){},
                ),

                // Settings
                ListTile(
                  leading:SvgPicture.asset("assets/icons/Setting.svg"),
                  title: Text('Setting',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  onTap: (){
                    Get.toNamed("/setting_screen");
                  },
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: ListTile(
                leading: SvgPicture.asset("assets/icons/Logout.svg"),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
