class PopularFoodItemModel {
  final int foodId;
  final double averageRating;
  final Food food;

  PopularFoodItemModel({
    required this.foodId,
    required this.averageRating,
    required this.food,
  });

  factory PopularFoodItemModel.fromJson(Map<String, dynamic> json) {
    return PopularFoodItemModel(
      foodId: json['food_id'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      food: Food.fromJson(json['food'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food_id': foodId,
      'average_rating': averageRating,
      'food': food.toJson(),
    };
  }
}

class Food {
  final String name;
  final String description;
  final String foodImageUrl;
  final double price;
  final int categoryId;

  Food({
    required this.name,
    required this.description,
    required this.foodImageUrl,
    required this.price,
    required this.categoryId,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      foodImageUrl: json['food_image_url'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      categoryId: json['category_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'food_image_url': foodImageUrl,
      'price': price,
      'category_id': categoryId,
    };
  }
}
