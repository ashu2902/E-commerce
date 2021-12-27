import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/source_code/Models/products.dart';
import 'package:task_app/source_code/Screens/form.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/widgets/product_title.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);
  List checkoutProducts = [];
  List totalCost = [];
  List ids = [];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: Scaffold(
          body: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) {
                ProductsModel items = controller.products.keys.toList()[index];
                // ProductsModel cost = controller.products.values.toList()[index];
                checkoutProducts.add(items.title);
                totalCost.add(items.price);
                ids.add(items.id);

                return CartProductCard(
                  controller: controller,
                  product: controller.products.keys.toList()[index],
                  qty: controller.products.values.toList()[index],
                  index: index,
                );
              }),
          floatingActionButton: ElevatedButton(
            onPressed: () async {
              print("items to checkout : $checkoutProducts $totalCost ");

              var uid = FirebaseAuth.instance.currentUser!.uid.toString();
              final CollectionReference checkout =
                  FirebaseFirestore.instance.collection('users/$uid/checkout');
              checkout.add({'items': checkoutProducts, 'prod_id': ids});

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserForm()));
            },
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final ProductsModel product;
  final int qty;
  final int index;
  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.index,
      required this.product,
      required this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 51,
              backgroundImage: NetworkImage(product.image!),
            ),
            Expanded(child: ProductTitle(product)
                // Text(product.title!,)
                ),
            IconButton(
                onPressed: () {
                  controller.removeProduct(product);
                },
                icon: Icon(Icons.remove_circle)),
            Text('$qty'),
            IconButton(
                onPressed: () {
                  controller.addProduct(product);
                },
                icon: Icon(Icons.add_circle))
          ],
        ),
      ),
    );
  }
}
