import 'package:flutter/material.dart';
import 'package:task_app/source_code/widgets/cart_product.dart';
import 'package:task_app/source_code/widgets/cart_total.dart';

class Cart extends StatelessWidget {
  const Cart({this.cartItems});
  final List? cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [CartProducts(), CartTotal()],
        ));
  }
}
