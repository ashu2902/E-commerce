import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_app/source_code/Screens/SignIn.dart';
import 'package:task_app/source_code/Screens/cart_screen.dart';
import 'package:task_app/source_code/Services/auth_service.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/controllers/product_controller.dart';
import 'package:task_app/source_code/widgets/product_list.dart';
import 'package:task_app/source_code/widgets/product_tile.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: ProductList());
  }
}
