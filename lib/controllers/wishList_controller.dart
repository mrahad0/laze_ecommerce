import 'package:get/get.dart';

class WishListController extends GetxController {
  final RxList<Map<String, dynamic>> wishList = <Map<String, dynamic>>[].obs;

  void toggleWish(Map<String, dynamic> product) {
    bool isExist = wishList.any((item) => item["productName"] == product["productName"]);

    if (isExist) {
      wishList.removeWhere((item) => item["productName"] == product["productName"]);
    } else {
      wishList.add(product);
    }
  }

  bool isFavourite(Map<String, dynamic> product) {
    return wishList.any((item) => item["productName"] == product["productName"]);
  }

  void removeProduct(Map<String, dynamic> product) {
    wishList.removeWhere((item) => item["productName"] == product["productName"]);
  }
  void clearWishList() {
    wishList.clear();
  }
}
