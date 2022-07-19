import 'dart:convert';
import 'package:food_app_flutter/core/model/CategoryList.dart';
import 'package:food_app_flutter/core/model/meal_response_model.dart';
import 'package:food_app_flutter/core/services/url_service.dart';
import 'package:get/get.dart';

import '../model/meals_by_category.dart';

class AppApi extends GetConnect {
  final _urlService = Get.find<UrlService>();

  @override
  void onInit() {
    httpClient.baseUrl = _urlService.getAPiBaseUrl();
    httpClient.timeout = const Duration(minutes: 1);
    super.onInit();
  }

  Future<MealResponseModel> getMeals() async {
    var response = await get("/api/json/v1/1/random.php");
    if (!response.hasError) {
      var _result =
      MealResponseModel.fromJson(json.decode(response.bodyString!));
      print(response);
      return _result;
    } else {
      return MealResponseModel(meals: []);
    }
  }

  Future<MealsByCategoryList> getMealsByCategoryList(String id) async {
    var response = await get("/api/json/v1/1/filter.php?c=$id");
    if (!response.hasError) {
      var _result =
      MealsByCategoryList.fromJson(json.decode(response.bodyString!));
      return _result;
    } else {
      return MealsByCategoryList(meals: []);
    }
  }

  Future<CategoryList> getCategories() async {
    var response = await get("/api/json/v1/1/categories.php");
    if (!response.hasError) {
      var _result = CategoryList.fromJson(json.decode(response.bodyString!));
      return _result;
    } else {
      return CategoryList(categories: []);
    }
  }

  Future<MealResponseModel> getMealDetails(String id)async{
    var response = await get("/api/json/v1/1/lookup.php?i=$id");
    if(!response.hasError){
      var _result = MealResponseModel.fromJson(json.decode(response.bodyString!));
      return _result;
    } else{
      return MealResponseModel(meals: []);
    }
  }
}
