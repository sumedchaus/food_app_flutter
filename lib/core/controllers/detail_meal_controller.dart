import 'package:food_app_flutter/core/services/app_api.dart';
import 'package:get/get.dart';

import '../model/meal_response_model.dart';

class DetailMealController extends GetxController {
  final _appApi = Get.find<AppApi>();
  dynamic argumentData = Get.arguments;

  var detailMealData = MealResponseModel(meals: []).obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    getDetailMeal(argumentData[1].toString());
    super.onInit();
  }

  Future<void> getDetailMeal(String mealId) async {
    isLoading.value = true;
    var id = argumentData[1].toString();
    var _result = await _appApi.getMealDetails(mealId);
    if (_result != null) {
      print(_result);
      isLoading.value = false;
      detailMealData.value = _result;
    }
  }
}
