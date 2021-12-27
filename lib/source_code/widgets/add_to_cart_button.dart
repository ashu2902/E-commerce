import 'package:flutter/material.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/controllers/product_controller.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatefulWidget {
  AddToCartButton({required this.index});
  int index;
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    final ScrollController _scrollController = ScrollController();
    return Container(
        child: TextButton(
            onPressed: () {
              print(productController.productList[widget.index].toString());
              cartController
                  .addProduct(productController.productList[widget.index]);
            },
            child: Text(
              'Add to cart',
              style: TextStyle(fontSize: 18),
            ))

        // IconButton(
        //     onPressed: () {
        //       print(productController.productList[widget.index].toString());
        //       cartController
        //           .addProduct(productController.productList[widget.index]);
        //     },
        //     icon: Icon(Icons.add_box_rounded)),
        );
  }
}
