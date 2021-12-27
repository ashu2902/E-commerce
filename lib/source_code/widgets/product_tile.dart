import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/source_code/Models/products.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/widgets/product_dialog.dart';
import 'package:task_app/source_code/widgets/product_image.dart';
import 'package:task_app/source_code/widgets/product_title.dart';

class ProductTile extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProductsModel product;
  final int index;
  ProductTile(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height / 3.5,
      width: _width,
      child: GestureDetector(
        child: Card(
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductImage(product),
                ProductTitle(product),
              ],
            ),
          ),
        ),
        onTap: () => openProductDialog(context, index),
      ),
    );
  }

  openProductDialog(context, index) {
    showDialog(
        context: context, builder: (context) => ProductDialog(product, index));
  }
}
