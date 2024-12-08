class CategoryModel {
  final int id;
  final String categoryName;


  // Constructor
  CategoryModel({
    required this.id,
    required this.categoryName,

  });

  // Factory method for creating a Category object from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['name'],
   
    );
  }

  // Convert a Category object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': categoryName,
 
    };
  }
}
