// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/presentation/products/widgets/product_view.dart';

class TabView extends StatefulWidget {
  final List<Product> products;
  TabView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<TabView> createState() => _tabViewState();
}

class _tabViewState extends State<TabView> {
  
  @override
  Widget build(BuildContext context) {
    List<Product> products = widget.products;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemCount: products.length,
      itemBuilder: (context, index) {

        return ProductView(product: products[index]);
      },
    );
  }
}
