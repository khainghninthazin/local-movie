import 'package:get/get.dart';

import '../controllers/recommened_detail_page_controller.dart';

class RecommenedDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommenedDetailPageController>(
      () => RecommenedDetailPageController(),
    );
  }
}
