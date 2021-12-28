import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/source_code/Screens/cart_screen.dart';
import 'package:task_app/source_code/Services/auth_service.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/widgets/product_list.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final CartController controller = Get.put(CartController());

  setCartCount() {
    List items = controller.products.values.toList();
    print("ye items hai $items");
  }

  @override
  void initState() {
    super.initState();
    setCartCount();
  }

  @override
  Widget build(BuildContext context) {
    List items = controller.products.values.toList();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => signOut(context),
              );
            },
          ),
          actions: [
            Obx(
              () => Container(
                child: Stack(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  //this icon will tell the number of products added.
                  Text('${controller.products.values.toList().length}')
                ]),
              ),
            ),
          ],
        ),
        body: ProductList());
  }
}
