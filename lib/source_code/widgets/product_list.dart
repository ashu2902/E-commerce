import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/controllers/product_controller.dart';
import 'package:task_app/source_code/widgets/product_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  final ScrollController _scrollController = ScrollController();

  int currentPage = 1;
  List listProducts = [];
  int count = 2;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Shop here",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
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
                        print(productController.productList[index].toString());
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
    );
  }
}
