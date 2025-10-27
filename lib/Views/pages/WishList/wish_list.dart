import 'package:e_commerce/Views/base/Custom_title2/custome_title2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/wishList_controller.dart';


class WishList extends StatelessWidget {
  WishList({super.key});

  final WishListController wishController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Wishlist"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // 🔹 তোমার Custom Title Bar
         CustomeTitle2(),

          const SizedBox(height: 10),

          // 🔹 Wishlist Products List
          Expanded(
            child: Obx(() {
              if (wishController.wishList.isEmpty) {
                return const Center(
                  child: Text(
                    "No items in wishlist",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: wishController.wishList.length,
                itemBuilder: (context, index) {
                  final product = wishController.wishList[index];
                  return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['productName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            product['price'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                     ),
                    Positioned(
                        bottom: 6,
                        right: 6,
                        child: GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Remove Item?",
                              middleText: "Are you sure you want to remove this product from wishlist?",
                              textCancel: "Cancel",
                              textConfirm: "Yes",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                wishController.toggleWish(product);
                                Get.back();
                              },
                            );
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                        ),
                    )
                    ]
                  ),


                                       );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
