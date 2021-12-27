import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('sub total ${controller.productSubTotal.length}');
    return Obx(
      () => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Total',
              style: TextStyle(fontSize: 24),
            ),
            controller.productSubTotal.length == 0
                ? Text('nil')
                : Text(controller.total)
          ],
        ),
      ),
    );
  }
}
