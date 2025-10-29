import 'package:e_commerce/Data/models/Terms_Policy_About/aboutUs_model.dart';
import 'package:e_commerce/Data/models/Terms_Policy_About/termsConditon_model.dart';
import 'package:e_commerce/Data/services/api_checker.dart';
import 'package:e_commerce/Data/services/api_client.dart';
import 'package:e_commerce/Data/services/api_constant.dart';
import 'package:get/get.dart';

class AboutusController extends GetxController {
  var isLoading = false.obs;
  var aboutUsList = <AboutData>[].obs;

  Future<void> fetchAboutUs() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.aboutUs);

    if (response.statusCode == 200) {
      final aboutUs = AboutUsModel.fromJson(response.body);
      aboutUsList.value = aboutUs.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchAboutUs();
    super.onInit();
  }
}