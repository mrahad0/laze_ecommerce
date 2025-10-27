import 'package:get/get.dart';

class WishListController extends GetxController {
  var wishList = [].obs;

  void toggleWish(Map product) {
    if (wishList.contains(product)) {
      wishList.remove(product);
    } else {
      wishList.add(product);
    }
  }

  bool isFavourite(Map product) {
    return wishList.contains(product);
  }

  void removeProduct(Map product) {
    wishList.remove(product);
  }
}
