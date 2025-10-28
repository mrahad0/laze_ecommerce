import 'package:e_commerce/Data/models/product_model.dart';
import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:e_commerce/Data/services/api_client.dart';
import 'package:e_commerce/Data/services/api_constant.dart';

import 'package:get/get.dart';

class ProductController extends GetxController{

  var isProductLoading = false.obs;

  RxList<ProductData> productList = RxList<ProductData>();


  Future<void> fetchProductData()async{

    isProductLoading(true);

    final response = await ApiClient.getData(ApiConstant.productDataEndPoint);
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
        productList.value = data.map((e) => ProductData.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isProductLoading(false);


  }

}