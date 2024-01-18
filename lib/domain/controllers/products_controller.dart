


import 'package:ecommerce/data/api_client.dart';
import 'package:ecommerce/data/dio.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsController {
  final ApiClient _appServiceClient = ApiClient(DioFactory().getDio());


  Future<void> getProducts(BuildContext context) async {
    var result = await _appServiceClient.getProducts();
    context.read<ProductProvider>().setProducts(result);
  }

  Future<void> setSelectedProduct(BuildContext context, Product product) async {
    context.read<ProductProvider>().setSelectedProduct(product);
  }

}
