import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_app/source_code/controllers/cart_controller.dart';
import 'package:task_app/source_code/controllers/product_controller.dart';
import 'package:task_app/source_code/widgets/add_to_cart_button.dart';
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
  int? count;

  void initState() {
    super.initState();
    fetchProductCount();
    loadMoreProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 2,
              itemCount: productController.productList.length,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ProductTile(productController.productList[index], index),
                    // AddToCartButton(index: index)
                  ],
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ),
          ),
          productController.isLoading == true
              ? CircularProgressIndicator()
              : Container()
        ],
      ),
    );
  }

  fetchProductCount() {
    setState(() {
      count = productController.productList.length;
    });
  }

  loadMoreProducts() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          count = count! + 5;
        });
        productController.fetchProducts(count);
      }
    });
  }
}
