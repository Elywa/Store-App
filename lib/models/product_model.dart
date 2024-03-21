class ProductModle {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModle({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModle.fromJson(jsonData) {
    return ProductModle(
      id: jsonData['id'],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final String rate;
  final String count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['rate'], rate: jsonData['count']);
  }
}
