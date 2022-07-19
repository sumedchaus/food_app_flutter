import 'package:food_app_flutter/core/controllers/detail_meal_controller.dart';
import 'package:food_app_flutter/ui/widgets/circle_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class DetailedMealPage extends StatelessWidget {
  dynamic argumentData = Get.arguments;
  var controller = Get.put(DetailMealController());


  DetailedMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


            Obx(() =>
                controller.isLoading.value ? CircleProgressIndicator()
                : Text(controller.detailMealData.value.meals[0].strMeal.toString()),),
              Text(argumentData[1].toString())
            ],
          ),
        ),
      ),
    );
  }
}
