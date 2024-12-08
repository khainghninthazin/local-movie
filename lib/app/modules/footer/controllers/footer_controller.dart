import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterController extends GetxController {
  var selectedIndex = 0.obs;

  // Update the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  void onTabSelected(int index) {
    selectedIndex.value = index;
  }

  // List of widgets corresponding to the tabs
  final List<Widget> body = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];
}
