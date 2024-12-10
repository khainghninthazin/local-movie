class MovieModel {
  final String title;
  final String imagePath;
  final String releaseYear;
  final String duration;
  final String genre;
  final double rating;
  final String description;
  final List<String> badges;

  MovieModel({
    required this.title,
    required this.imagePath,
    required this.releaseYear,
    required this.duration,
    required this.genre,
    required this.rating,
    required this.description,
    required this.badges,
  });
}

enum movies { All, Acomedy, Animation, Dokument }

class moviesdetail {
  final int? id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;

  static var posterPath;

  moviesdetail(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.description,
      required this.image,
      required this.quantity});
}

class castdetail{
  final String name;
  final String postion;
  castdetail({required this.name, required this.postion});
}


