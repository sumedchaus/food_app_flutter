import 'package:flutter/material.dart';
import 'package:food_app_flutter/app_route.dart';
import 'package:food_app_flutter/core/controllers/home_controller.dart';
import 'package:food_app_flutter/ui/colors.dart';
import 'package:food_app_flutter/ui/widgets/big_text.dart';
import 'package:food_app_flutter/ui/widgets/small_text.dart';
import 'package:get/get.dart';

import '../widgets/circle_progress_indicator.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  var errorText = false;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "India",
                          color: colorMain,
                          size: 30,
                        ),
                        SmallText(text: "Hyderabad")
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorMain),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BigText(
                  text: "Food you Might Like",
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.detailedMealPage, arguments:[
                      controller.randomMealData.value.meals[0].strMeal,
                        controller.randomMealData.value.meals[0].idMeal]
                    );
                    // Get.toNamed(RouteNames.detailedMealPage,arguments:[
                    //   {"mealId": "${controller.RandomMealDataList.value.strMeal}"}
                    // ]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    // padding: EdgeInsets.all(16),
                    height: 200,
                    width: Get.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: controller.isLoading.value
                          ? CircleProgressIndicator()
                          : Image.network(
                              controller.randomMealData.value.meals[0].strMealThumb!,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BigText(
                  text: "Popular Items...",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FoodPageBody(),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BigText(
                  text: "Category",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodPageBody extends StatelessWidget {
  FoodPageBody({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() => controller.isLoading1.value ? SizedBox()
        //   :
        Container(
      height: 120,
      child: Obx(
        () => PageView.builder(
            itemCount: controller.mealsByCategoryList.value.length,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: controller.isLoading1.value
            ? CircleProgressIndicator()
            : Image.network(
                controller.mealsByCategoryList.value[index].strMealThumb,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}

// class CategoryTiles extends StatelessWidget {
//   final HomeController controller = Get.find<HomeController>();
//
//   CategoryTiles({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: controller.category.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             height: 20,
//             width: 20,
//             child: Card(
//
//               elevation: 20,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child:
//                   Text(controller.category.value[index].strCategory)
//                 // controller.isLoading1.value
//                 //     ? CircleProgressIndicator()
//                 //     : Image.network(
//                 //         controller.category.value[index].strCategoryThumb,
//                 //         fit: BoxFit.fill,
//                 //       ),
//               ),
//             ),
//           );
//         });
//   }
// }