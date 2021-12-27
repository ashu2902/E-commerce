import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_app/source_code/Models/products.dart';
import 'package:task_app/source_code/widgets/add_to_cart_button.dart';
import 'package:task_app/source_code/widgets/product_rating.dart';
import 'package:task_app/source_code/widgets/product_tile.dart';

class ProductDialog extends StatefulWidget {
  final ProductsModel product;
  final int index;
  ProductDialog(this.product, this.index);
  @override
  _ProductDialogState createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: _height / 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: _height / 4,
                child: CachedNetworkImage(imageUrl: widget.product.image!),
              ),
              Text('${widget.product.title}',
                  style: TextStyle(fontFamily: 'avenir', fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductRating(widget.product, 30),
                    Text('\$${widget.product.price}',
                        style: TextStyle(fontFamily: 'avenir', fontSize: 20)),
                  ],
                ),
              ),
              AddToCartButton(index: widget.index)
            ],
          ),
        ),
      ),
    );
  }
}
