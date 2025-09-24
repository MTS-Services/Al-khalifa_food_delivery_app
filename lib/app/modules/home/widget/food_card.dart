import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double? rating; // optional
  final double? price;  // optional
  final VoidCallback? onAdd; // optional

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.rating,
    this.price,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // ✅ Add button শুধু onAdd দিলে দেখাবে
              if (onAdd != null)
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: onAdd,
                    ),
                  ),
                ),
            ],
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ✅ Rating শুধু rating দিলে দেখাবে
          if (rating != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "(${rating!.toStringAsFixed(2)})",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

          if (price != null)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Tk ${price!.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
