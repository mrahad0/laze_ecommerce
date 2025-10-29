import 'package:e_commerce/Data/models/Terms_Policy_About/privacyPolicy_model.dart';
import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:e_commerce/Data/services/api_client.dart';
import 'package:e_commerce/Data/services/api_constant.dart';
import 'package:get/get.dart';

class PrivacypolicyController extends GetxController {
  var isLoading = false.obs;
  var policyList = <PrivacyData>[].obs;

  Future<void> fetchPrivacyPolicy() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.privacy_policy);

    if (response.statusCode == 200) {
      final privacyPolicy = PrivacyPolicy.fromJson(response.body);
      policyList.value = privacyPolicy.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchPrivacyPolicy();
    super.onInit();
  }
}