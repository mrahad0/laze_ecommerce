import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Data/models/userProfile_model.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';

class UserprofileController extends GetxController{

  var isProductLoading = false.obs;

  RxList<UserData> userinfo = <UserData>[].obs;

  Future<void> fetchUserInfo()async {
    isProductLoading(true);

    final response = await ApiClient.getData(ApiConstant.userprofile);
    if (response.statusCode == 200) {
      final data = response.body['data'];
      userinfo.clear();
      userinfo.add(UserData.fromJson(data));
    }
     else {
      ApiChecker.checkApi(response);
    }
    isProductLoading(false);
  }
  }