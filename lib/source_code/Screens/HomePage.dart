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
import 'package:task_app/source_code/widgets/product_tile.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  final ScrollController _scrollController = ScrollController();

  int currentPage = 1;
  List listProducts = [];
  int count = 2;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        count += 5;
        productController.fetchProducts(count);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Shop here",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child:

                    // if (productController.isLoading.value) {
                    //   return Center(child: CircularProgressIndicator());
                    // } else
                    StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 1,
              itemCount: productController.productList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return
                    // Row(children: [
                    Container(
                        child: Column(
                  children: [
                    ProductTile(productController.productList[index]),
                    IconButton(
                        onPressed: () {
                          print(
                              productController.productList[index].toString());
                          cartController
                              .addProduct(productController.productList[index]);
                        },
                        icon: Icon(Icons.add_box_rounded)),
                  ],
                ));
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            )),
            productController.isLoading == true
                ? CircularProgressIndicator()
                : Container()
          ],
        ),
      ),
    );
  }
}
