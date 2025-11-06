// class MyOrderModel {
//   double? totalAmount; // Changed from int? to double?
//   String? deliveryAddress;
//   String? deliveryFullAddress;
//   String? status;
//   int? id;
//   String? createdAt;
//   String? updatedAt;
//   List<OrderItems>? orderItems;
//
//   MyOrderModel({
//     this.totalAmount,
//     this.deliveryAddress,
//     this.deliveryFullAddress,
//     this.status,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.orderItems,
//   });
//
//   factory MyOrderModel.fromJson(Map<String, dynamic> json) {
//     return MyOrderModel(
//       totalAmount: _toDouble(json['total_amount']),
//       deliveryAddress: json['delivery_address'] as String?,
//       status: json['status'] as String?,
//       deliveryFullAddress: json['delivery_full_address'] as String?,
//       id: json['id'] as int?,
//       createdAt: json['created_at'] as String?,
//       updatedAt: json['updated_at'] as String?,
//       orderItems: json['order_items'] != null
//           ? (json['order_items'] as List)
//               .map((item) => OrderItems.fromJson(item))
//               .toList()
//           : null,
//     );
//   }
//
//   static double? _toDouble(dynamic value) {
//     if (value == null) return null;
//     if (value is double) return value;
//     if (value is int) return value.toDouble();
//     if (value is String) return double.tryParse(value);
//     return null;
//   }
//
//   static int? _toInt(dynamic value) {
//     if (value == null) return null;
//     if (value is int) return value;
//     if (value is double) return value.toInt();
//     if (value is String) return int.tryParse(value);
//     return null;
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'total_amount': totalAmount,
//       'delivery_address': deliveryAddress,
//       'delivery_full_address': deliveryFullAddress,
//       'id': id,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'order_items': orderItems?.map((item) => item.toJson()).toList(),
//     };
//   }
// }
//
// class OrderItems {
//   int? id;
//   Food? food;
//
//   OrderItems({this.id, this.food});
//
//   factory OrderItems.fromJson(Map<String, dynamic> json) {
//     return OrderItems(
//       id: MyOrderModel._toInt(json['id']),
//       food: json['food'] != null ? Food.fromJson(json['food']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'food': food?.toJson(),
//     };
//   }
// }
//
// class Food {
//   String? name;
//   String? description;
//   String? foodImageUrl;
//   double? price; // Changed from int? to double?
//   dynamic perPerson;
//   int? categoryId;
//
//   Food({
//     this.name,
//     this.description,
//     this.foodImageUrl,
//     this.price,
//     this.perPerson,
//     this.categoryId,
//   });
//
//   factory Food.fromJson(Map<String, dynamic> json) {
//     return Food(
//       name: json['name'] as String?,
//       description: json['description'] as String?,
//       foodImageUrl: json['food_image_url'] as String?,
//       price: MyOrderModel._toDouble(json['price']),
//       perPerson: json['per_person'],
//       categoryId: MyOrderModel._toInt(json['category_id']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'description': description,
//       'food_image_url': foodImageUrl,
//       'price': price,
//       'per_person': perPerson,
//       'category_id': categoryId,
//     };
//   }
// }



class OrderDetailsModel {
  final int id;
  final double totalAmount;
  final String phoneNumber;
  final String deliveryAddress;
  final String deliveryFullAddress;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final List<OrderItem> orderItems;

  OrderDetailsModel({
    required this.id,
    required this.totalAmount,
    required this.phoneNumber,
    required this.deliveryAddress,
    required this.deliveryFullAddress,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.orderItems,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      phoneNumber: json['phone_number'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      deliveryFullAddress: json['delivery_full_address'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user']),
      orderItems: (json['order_items'] as List)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class OrderItem {
  final int id;
  final Food food;

  OrderItem({required this.id, required this.food});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      food: Food.fromJson(json['food']),
    );
  }
}

class Food {
  final String name;
  final String description;
  final String foodImageUrl;
  final double price;
  final int? perPerson;
  final int categoryId;

  Food({
    required this.name,
    required this.description,
    required this.foodImageUrl,
    required this.price,
    this.perPerson,
    required this.categoryId,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      foodImageUrl: json['food_image_url'] ?? '',
      price: (json['price'] as num).toDouble(),
      perPerson: json['per_person'],
      categoryId: json['category_id'],
    );
  }
}
