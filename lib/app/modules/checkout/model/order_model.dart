class OrderRequest {
  final double totalAmount;
  final String deliveryAddress;
  final String specialInstruction;
  final List<OrderItem> orderItems;

  OrderRequest({
    required this.totalAmount,
    required this.deliveryAddress,
    required this.specialInstruction,
    required this.orderItems,
  });

  // // Add validation
  // void validate() {
  //   if (totalAmount <= 0) {
  //     throw Exception('Total amount must be greater than 0');
  //   }
  //   if (deliveryAddress.isEmpty) {
  //     throw Exception('Delivery address is required');
  //   }
  //   if (orderItems.isEmpty) {
  //     throw Exception('Order must contain at least one item');
  //   }
  // }

  Map<String, dynamic> toJson() => {
    'total_amount': totalAmount,
    'delivery_address': deliveryAddress,
    'delivery_full_address': specialInstruction,
    'order_items': orderItems.map((item) => item.toJson()).toList(),
  };
}

class OrderItem {
  final int foodId;

  OrderItem({required this.foodId});

  Map<String, dynamic> toJson() => {'food_id': foodId};
}
