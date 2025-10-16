import 'package:e_commerce/Views/pages/DrawerScreens/DrawerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context){
          return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset("assets/icons/Menu.svg")
          );
        }),

        actions: [
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset("assets/icons/Cart.svg"))
        ],
      ),
      body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 Text("Home",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),

                  Text(
                    "Welcome to Laza",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: CustomColors.greyColor),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
