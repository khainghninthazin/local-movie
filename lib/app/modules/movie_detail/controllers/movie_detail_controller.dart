import 'dart:convert';
 // Replace with your actual path
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/app/data/movies_details.dart';

class MovieDetailsController extends GetxController {
  final movieId = Get.arguments; // Get the movie ID passed as an argument
  final movieDetails = Rxn<MovieDetail>();
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    const String apiKey = '19d6149f34738ec93c495cd0527246ae';
    const String baseUrl = 'https://api.themoviedb.org/3';
    final String url = '$baseUrl/movie/$movieId?api_key=$apiKey&language=en-US';

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        movieDetails.value = MovieDetail.fromJson(jsonData);
      } else {
        throw Exception('Failed to load movie details: ${response.reasonPhrase}');
      }
    } catch (e) {
      errorMessage.value = 'Error fetching movie details: $e';
      print(errorMessage.value); // You can replace this with a logger
    } finally {
      isLoading.value = false;
    }
  }
}
