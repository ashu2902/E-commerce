import 'package:flutter/material.dart';
import 'package:task_app/source_code/Models/products.dart';

class ProductRating extends StatelessWidget {
  ProductRating(this.product, this.size);
  final ProductsModel product;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.rating!.rate.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            Icons.star,
            size: size,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
