import 'package:e_commerce/Data/models/Terms_Policy_About/termsConditon_model.dart';
import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:e_commerce/Data/services/api_client.dart';
import 'package:e_commerce/Data/services/api_constant.dart';
import 'package:get/get.dart';

class TermsController extends GetxController {
  var isLoading = false.obs;
  var termsList = <TermsData>[].obs;

  Future<void> fetchTermsCondition() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.terms_condition);

    if (response.statusCode == 200) {
      final termsCondition = TermsCondition.fromJson(response.body);
      termsList.value = termsCondition.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchTermsCondition();
    super.onInit();
  }
}
