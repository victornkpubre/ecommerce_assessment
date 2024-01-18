import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/controllers/products_controller.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final Product product;

  ProductView({super.key, required this.product});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductsController _productsController = ProductsController();


  bool isFavorite() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    
    return Stack(
      children: [
        InkWell(
          onTap: () {
            _productsController.setSelectedProduct(context, product);
            Navigator.pushNamed(context, '/productdetails');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: (context, value) => Center(
                      child: CircularProgressIndicator(color: primaryColor)),
                ),
              ),
              Text(product.title, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left),
              Text("\$${product.price}", textAlign: TextAlign.left),
            ],
          ),
        ),
      ],
    );
  }
}
