import 'package:flutter/material.dart';
import 'package:task_app/source_code/Models/products.dart';

class ProductTitle extends StatelessWidget {
  ProductTitle(this.product);
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        product.title!,
        maxLines: 2,
        style:
            const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
