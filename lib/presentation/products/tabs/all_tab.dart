import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:ecommerce/presentation/products/widgets/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      List<Product>? products = provider.getProducts();

      return Container(
          child: products == null
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : TabView(products: products));
    });
  }
}
