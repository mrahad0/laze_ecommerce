import 'package:e_commerce/Utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/routes.dart';
import 'helpers/di.dart' as di;

void main()async{
  await di.init();
  runApp(E_CommerceApp());
}

class E_CommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "E-Commerce App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
      ),
      initialRoute: Routes.splashScreen,
      getPages: pages
    );
  }
}