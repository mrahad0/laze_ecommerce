import 'package:e_commerce/Views/pages/Product_Detail/productDetail_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/wishList_controller.dart';

class ProductList extends StatelessWidget {
      ProductList ({super.key});

      final WishListController wishController = Get.put(WishListController());


      List products = [
    {
      "productName": "Nike Sportswear Club Fleece",
      "image": "assets/images/img.png",
      "price": "\$99"
    },
    {
      "productName": "Training Top Nike Sport Clash",
      "image": "assets/images/img_1.png",
      "price": "\$120"

    },
    {
      "productName": "Trail Running Jacket Nike Windrunner",
      "image": "assets/images/img_2.png",
      "price": "\$160"
    },
    {
      "productName": "Nike Sportswear Club",
      "image": "assets/images/Rectangle 569.png",
      "price": "\$150"
    },

  ];
  @override
  Widget build(BuildContext context) {

    final repeatedList = List.generate(10, (i) => products[i % products.length]);

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: repeatedList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {

        final product = repeatedList[index];

        return GestureDetector(
          onTap: (){
            Get.to(ProductDetailScreen(productName: product["productName"], image: product["image"], price: product["price"],));
            },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: 200,
                      width: double.infinity,
                      image: AssetImage(
                        product["image"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Obx(() {
                      bool isFav = wishController.isFavourite(product);
                      return GestureDetector(
                        onTap: () {
                          wishController.toggleWish(product);
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isFav ? Colors.red : Colors.grey,
                          size: 26,
                        ),
                      );
                    }),
                    ),
                ],
              ),
              Text(
                product["productName"],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                product["price"],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
