import 'dart:async';

import 'package:food_app_flutter/core/model/CategoryList.dart';
import 'package:food_app_flutter/core/model/meals_by_category.dart';
import 'package:food_app_flutter/core/services/app_api.dart';
import 'package:get/get.dart';

import '../model/meal_response_model.dart';

class HomeController extends GetxController {
  final _appApi = Get.find<AppApi>();
  var randomMealData = MealResponseModel(meals: []).obs;
  var isLoading = false.obs;
  var isLoading1 = false.obs;


  var mealsByCategory = MealsByCategoryList(meals: []).obs;
  var mealsByCategoryList =
      [MealsByCategory(idMeal: "", strMeal: "", strMealThumb: "")].obs;
  Timer? timer;

  var categoryList = CategoryList(categories: []);
  var category = [Categories(
      idCategory: "",
      strCategory: "",
      strCategoryThumb: "",
      strCategoryDescription: "")].obs;

  @override
  void onInit() {
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getRandomMeals());

    getRandomMeals();
    getMealsByCategory();
    // getCategories();
    super.onInit();
  }

  Future<void> getRandomMeals() async {
    isLoading.value = true;
    var _result = await _appApi.getMeals();
    if (_result != null) {
      print(_result);
      isLoading.value = false;
      randomMealData.value = _result;
    }
  }

  Future<void> getMealsByCategory() async {
    isLoading1.value = true;
    var _result = await _appApi.getMealsByCategoryList("Seafood");
    if (_result != null) {
      print(_result);
      isLoading1.value = false;
      mealsByCategory.value = _result;
      var data = _result.meals;
      mealsByCategoryList.value = data;
    }
  }

  Future<void> getCategories() async {
    var _result = await _appApi.getCategories();
    if (_result != null) {
      categoryList = _result;
      category.value = _result.categories;
    }
  }
}
