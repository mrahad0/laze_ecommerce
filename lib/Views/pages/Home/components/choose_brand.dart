import 'package:e_commerce/Views/pages/Home/chooseBrand_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../Routes/routes.dart';
import '../../../../Utils/color.dart';


class ChooseBrands extends StatelessWidget {
  ChooseBrands({super.key});
  List brands = [
    {
      "name": "Adidas",
      "icon": "assets/images/Adidas (1).svg",
    },
    {"name": "Nike",
      "icon": "assets/images/Nike.svg",

    },
    {
      "name": "Fila",
      "icon": "assets/images/fila-9 1.svg",
    },
    {
      "name": "Nike",
      "icon": "assets/images/Nike.svg",
    },
    {
      "name": "Adidas",
      "icon": "assets/images/Adidas (1).svg",
    },
    {
      "name": "Fila",
      "icon": "assets/images/fila-9 1.svg",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Choose Brand",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: CustomColors.greyColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return InkWell(
                // InkWell-এর onTap ফাংশন:
                onTap: () {
                  Get.to(BrandListScreen(brandLogoPath: ""),
                    arguments: brand["icon"], // শুধু ডেটা পাস
                  );
                },
                child: Container(
                  height: 50,
                  width: 115,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F6FA),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFEFEFE),
                        ),
                        child: SvgPicture.asset(
                          brands[index]["icon"],
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        brands[index]["name"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            itemCount: brands.length,
          ),
        ),
      ],
    );
  }
}