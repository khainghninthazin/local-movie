import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app/app/data/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/app/data/color_constants.dart';
import 'package:movie_app/app/data/popular_model.dart';

class CategoryPageController extends GetxController {
  //TODO: Implement CategoryPageController

  var categories = <CategoryModel>[].obs;
  var popularmodel = <popularmovies>[].obs;
  CategoryModel get selectedCategory => categories[selectedIndex.value];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchrecommened();
  }

  final List<String> images = [
    'assets/m1.jpeg',
    'assets/m2.jpeg',
    'assets/m1.jpeg',
    'assets/m2.jpeg',
    'assets/m1.jpeg',
  ];

  Future<void> fetchCategories() async {
    final url =
        '$baseURL/genre/movie/list?api_key=19d6149f34738ec93c495cd0527246ae';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        // Check if 'data' key exists and is a list
        if (jsonData['genres'] is List) {
          categories.value = (jsonData['genres'] as List)
              .map((data) => CategoryModel.fromJson(data))
              .toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchrecommened() async {
    final url =
        '$baseURL/movie/popular?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        // Check if 'data' key exists and is a list
        if (jsonData['results'] is List) {
          popularmodel.value = (jsonData['results'] as List)
              .map((data) => popularmovies.fromJson(data))
              .toList();
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  var selectedIndex = 0.obs;
  // Update the selected index
  void selectCategory(int index) {
    selectedIndex.value = index;
  }

  void updateIndex(int index) {
    selectedIndex.value = index;
  }



  void increment() => count.value++;



}
