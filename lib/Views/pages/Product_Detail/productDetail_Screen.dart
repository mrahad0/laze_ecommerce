import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String image;
  final String price;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back)),
              Center(
                child:  Image.asset(
                  image,
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
                      productName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 10),
              const Text(
                "Men's Printed Pullover Hoodie",
                style: TextStyle(color: Colors.grey),
              ),
        
              const SizedBox(height: 25),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Text("Size Guide", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["S", "M", "L", "XL", "2XL"]
                    .map((size) => Container(
                  height: 40,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(size, style: const TextStyle(fontWeight: FontWeight.w500)),
                ))
                    .toList(),
              ),
        
              const SizedBox(height: 30),
        
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with modern style. It’s soft, comfortable, and perfect for your workouts or casual days.",
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
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    radius: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Ronald Richards", style: TextStyle(fontWeight: FontWeight.w600)),
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
                      Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
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
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
        
        
              SizedBox(height: 20,),
        
        
              CustomButton(title: "Add to Cart",onpress: (){},),
        
        
        
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

