import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:ecommerce/presentation/products/widgets/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WomensTab extends StatefulWidget {
  const WomensTab({super.key});

  @override
  State<WomensTab> createState() => _WomensTabState();
}

class _WomensTabState extends State<WomensTab> {
  List<Product>? filterProducts(List<Product>? products, String category) {
    return products
        ?.where((element) => element.category.compareTo(category) == 0)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      List<Product>? products =
          filterProducts(provider.getProducts(), "women's clothing");

      return Container(
          child: products == null
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : TabView(products: products));
    });
  }
}