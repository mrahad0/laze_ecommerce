import 'package:e_commerce/Data/services/api_client.dart';
import 'package:e_commerce/Data/services/api_constant.dart';
import 'package:get/get.dart';

import '../Data/models/productDetail_model.dart';
import '../Data/services/api_checker.dart';


class ProductDetailController extends GetxController{

var isProductLoading = false.obs;

RxList<ProductDetail> productsDetail = RxList<ProductDetail>();

Future<void> fetchProductDetail() async {
  isProductLoading.value = true;

  final response = await ApiClient.getData(ApiConstant.productDetail);
  if (response.statusCode == 200){
    List<dynamic> data = response.body['data'];
    productsDetail.value = data.map((e) => ProductDetail.fromJson(e)).toList();
  }
  else{
    ApiChecker.checkApi(response);
  }
  isProductLoading.value=false;
 }

}