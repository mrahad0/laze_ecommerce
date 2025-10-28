import 'package:e_commerce/Data/services/api_constant.dart';
import 'package:e_commerce/Views/pages/Product_Detail/productDetail_Screen.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/wishList_controller.dart';

class ProductList extends StatefulWidget {
      ProductList ({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
      final WishListController wishController = Get.put(WishListController());

      final _productController = Get.put(ProductController());


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
  void initState() {
    _productController.fetchProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Obx(()=> _productController.isProductLoading.value?
    Center(child: CircularProgressIndicator(),):
    MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: _productController.productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {

        final product =   _productController.productList[index];

        return GestureDetector(
          onTap: (){

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
                      image: NetworkImage(
                        "${ApiConstant.baseUrl}${product.images[0]}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Obx(() {

                      return GestureDetector(
                        onTap: () {

                        },
                        child: Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 26,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
               product.price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
