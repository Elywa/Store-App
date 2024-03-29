class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData["title"],
      price: jsonData["price"],
      category: jsonData['category'],
      description: jsonData["description"],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating'] ?? {}),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}
