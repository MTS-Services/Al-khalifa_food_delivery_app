class MyOrderModel {
  double? totalAmount; // Changed from int? to double?
  String? deliveryAddress;
  String? deliveryFullAddress;
  int? id;
  String? createdAt;
  String? updatedAt;
  List<OrderItems>? orderItems;

  MyOrderModel({
    this.totalAmount,
    this.deliveryAddress,
    this.deliveryFullAddress,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      totalAmount: _toDouble(json['total_amount']),
      deliveryAddress: json['delivery_address'] as String?,
      deliveryFullAddress: json['delivery_full_address'] as String?,
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      orderItems: json['order_items'] != null
          ? (json['order_items'] as List)
              .map((item) => OrderItems.fromJson(item))
              .toList()
          : null,
    );
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'total_amount': totalAmount,
      'delivery_address': deliveryAddress,
      'delivery_full_address': deliveryFullAddress,
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'order_items': orderItems?.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItems {
  int? id;
  Food? food;

  OrderItems({this.id, this.food});

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return OrderItems(
      id: MyOrderModel._toInt(json['id']),
      food: json['food'] != null ? Food.fromJson(json['food']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food': food?.toJson(),
    };
  }
}

class Food {
  String? name;
  String? description;
  String? foodImageUrl;
  double? price; // Changed from int? to double?
  dynamic perPerson;
  int? categoryId;

  Food({
    this.name,
    this.description,
    this.foodImageUrl,
    this.price,
    this.perPerson,
    this.categoryId,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'] as String?,
      description: json['description'] as String?,
      foodImageUrl: json['food_image_url'] as String?,
      price: MyOrderModel._toDouble(json['price']),
      perPerson: json['per_person'],
      categoryId: MyOrderModel._toInt(json['category_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'food_image_url': foodImageUrl,
      'price': price,
      'per_person': perPerson,
      'category_id': categoryId,
    };
  }
}