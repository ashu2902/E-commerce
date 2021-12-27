import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_app/source_code/Screens/cart_screen.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    return Obx(
      () => Container(
        child: Stack(children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          //this icon will tell the number of products added.
          Text('${controller.products.values.toList().length}')
        ]),
      ),
    );
  }
}
