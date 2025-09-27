// models/food_model.dart
class Food {
  final int id;
  final String name;
  final double price;
  final String description;
  final String foodImageUrl;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.foodImageUrl,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      foodImageUrl: json['food_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'food_image_url': foodImageUrl,
    };
  }
}


// models/cart_item_model.dart
class CartItem {
  final int id;
  final int productId;
  final int quantity;
  final int userId;
  final Food food;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.userId,
    required this.food,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      userId: json['user_id'],
      food: Food.fromJson(json['food']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'quantity': quantity,
      'user_id': userId,
      'food': food.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  CartItem copyWith({
    int? id,
    int? productId,
    int? quantity,
    int? userId,
    Food? food,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      userId: userId ?? this.userId,
      food: food ?? this.food,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}