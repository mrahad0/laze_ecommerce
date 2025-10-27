import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../base/Custom_title2/custome_title2.dart';

class WishList extends StatefulWidget {
   WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WishList",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const CustomTitle(), // AppBar er niche
          Expanded(
            child: Obx(() {
              if (wishController.wishList.isEmpty) {
                return const Center(child: Text("No items in wishlist ❤️"));
              }
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                itemCount: wishList.wishList.length,
                itemBuilder: (context, index) {
                  final product = wishController.wishList[index];
                  return /* Card widget */;
                },
              );
            }),
          ),
        ],
      ),
    );

  }
}
