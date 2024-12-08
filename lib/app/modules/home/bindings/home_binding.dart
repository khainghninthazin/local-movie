import 'package:get/get.dart';

import 'package:movie_app/app/modules/home/controllers/category_page_controller.dart';
import 'package:movie_app/app/modules/home/controllers/category_page_controller.dart';
import 'package:movie_app/app/modules/home/controllers/recommened_page_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryPageController>(
      () => CategoryPageController(),
    );
    Get.lazyPut<CategoryPageController>(
      () => CategoryPageController(),
    );
    Get.lazyPut<RecommenedPageController>(
      () => RecommenedPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
