import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app/app/data/color_constants.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/app/data/popular_model.dart';

class RecommenedPageController extends GetxController {
  //TODO: Implement RecommenedPageController

  var popularmodel = <popularmovies>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
