import 'package:food_app_flutter/core/services/app_api.dart';
import 'package:food_app_flutter/core/services/url_service.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UrlService());
    Get.put(AppApi(), permanent: true);
  }

}

