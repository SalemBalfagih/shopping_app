class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel(
      {required this.id,
      required this.rating,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});

  factory ProductsModel.fromJson(JsonData) {
    return ProductsModel(
        id: JsonData['id'],
        title: JsonData['title'],
        price: JsonData['price'].toDouble(),
        description: JsonData['description'],
        category: JsonData['category'],
        image: JsonData['image'],
        rating: RatingModel.fromJson(JsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(JsonData) {
    return RatingModel(
      rate: JsonData['rate'].toDouble(),
      count: JsonData['count'],
    );
  }
}
