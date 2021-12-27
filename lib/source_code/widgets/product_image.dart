import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_app/source_code/Models/products.dart';

class ProductImage extends StatelessWidget {
  final ProductsModel product;
  ProductImage(this.product);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height / 6,
      width: _width / 3,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CachedNetworkImage(
          imageUrl: product.image!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
