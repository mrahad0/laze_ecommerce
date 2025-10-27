import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/wishList_controller.dart';

Future init()async{
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => WishListController(), fenix: true);

}