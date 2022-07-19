import 'package:food_app_flutter/ui/pages/detailed_meal_page.dart';
import 'package:food_app_flutter/ui/pages/home_page.dart';
import 'package:get/get.dart';

class RouteNames {
  static String home = "/splash";
  static String detailedMealPage = "/detailed_meal_page";
// static String login = "/login";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.detailedMealPage,
      page: () => DetailedMealPage(),
      transition: Transition.cupertino,
    ),
  ];
}
