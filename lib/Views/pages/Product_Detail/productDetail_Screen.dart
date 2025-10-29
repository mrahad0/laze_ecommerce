import 'package:e_commerce/Data/models/productDetail_model.dart';
import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Data/services/api_constant.dart';
import '../../../controllers/productDetail_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final String image;
  final String price;
  final String description;
  final String sizes;
  final String brandName;
  final String brandImage;



  ProductDetailScreen({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.description,
    required this.sizes,
    required this.brandName,
    required this.brandImage,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  final _productDetailController = Get.put(ProductDetailController());

  @override
  void initState() {
    _productDetailController.fetchProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productDetail = _productDetailController.productsDetail;
    final List<String> sizeList = widget.sizes.split(',');

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                  child: Image.network(
                    "${ApiConstant.baseUrl}${widget.image}",
                    width: 280,
                    height: 280,
                    fit: BoxFit.contain,
                  ),
                ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                    widget.productName,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.brandName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(height: 77,
                width: 335,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network("${ApiConstant.baseUrl}${widget.image}"),
                  ],
                ),
                ),),
              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                   "Size",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text("Size Guide", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                sizeList
                        .map(
                          (size) => Container(
                            height: 40,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              size,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),

              const SizedBox(height: 30),

              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),

              const SizedBox(height: 30),

              const Text(
                "Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img_2.png"),
                    radius: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ronald Richards",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: TextStyle(color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "4.8",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price", style: TextStyle(color: Colors.grey)),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Align(alignment: Alignment.center,
                  child: CustomButton(title: "Add to Cart", onpress: () {})),]

          ),
        ),
      )
    );
  }
}

