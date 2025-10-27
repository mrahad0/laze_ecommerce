import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce/Views/pages/Home/chooseBrand_Screen.dart';

import 'components/product_list.dart';


class BrandListScreen extends StatelessWidget {

  final brandLogoPath;

  const BrandListScreen({
    required this.brandLogoPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          brandLogoPath,
          height: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset("assets/icons/Cart.svg"),
          )
        ],
    ),
      body: SingleChildScrollView(
        child: Column(
            children: [Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "365 Items",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Available in stock",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: 37,
                      width: 68,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF5F6FA),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/sort.svg",
                            fit: BoxFit.scaleDown,
                          ),

                          SizedBox(width: 5),

                          Text(
                            "Sort",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ProductList()
        ]

        )
      ),
    );
  }
}