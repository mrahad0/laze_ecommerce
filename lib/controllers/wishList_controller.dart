import 'package:get/get.dart';

class WishListController extends GetxController {
  // Favourite product list
  final RxList<Map<String, dynamic>> wishList = <Map<String, dynamic>>[].obs;

  /// Toggle Wishlist Add/Remove
  void toggleWish(Map<String, dynamic> product) {
    // check if already added
    bool isExist = wishList.any((item) => item["productName"] == product["productName"]);

    if (isExist) {
      wishList.removeWhere((item) => item["productName"] == product["productName"]);
    } else {
      wishList.add(product);
    }
  }

  /// Check if a product is favourite
  bool isFavourite(Map<String, dynamic> product) {
    return wishList.any((item) => item["productName"] == product["productName"]);
  }

  /// Remove product manually (used in delete dialog)
  void removeProduct(Map<String, dynamic> product) {
    wishList.removeWhere((item) => item["productName"] == product["productName"]);
  }

  /// Clear all wishlist items (optional)
  void clearAll() {
    wishList.clear();
  }
}
