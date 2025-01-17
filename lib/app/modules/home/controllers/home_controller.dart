

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:movie_app/app/modules/home/views/home_view.dart';
import 'package:movie_app/app/modules/movie_detail/views/movie_detail_view.dart';


class HomeController extends GetxController {
  

  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomeView(), const MovieDetailsView()];
  void onTabSelected(int index) {
    selectedIndex.value = index;
  }

  late TabController tabBarController;



 

  @override
  void onClose() {
    tabBarController
        .dispose(); // Dispose of the TabController to free up resources
    super.onClose();
  }
}
