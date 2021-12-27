import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/source_code/Screens/cart_screen.dart';
import 'package:task_app/source_code/Services/auth_service.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/widgets/cart_icon.dart';
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
          actions: [CartIcon()],
        ),
        body: ProductList());
  }
}
