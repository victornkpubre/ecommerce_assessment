//User
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/entities/user.dart';
import 'package:flutter/material.dart';

//User
class UserProvider extends ChangeNotifier {
  User? _user;
  UserFavorites _favorites = UserFavorites([]);

  User? getUser() {
    return _user;
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  UserFavorites getFavorite() {
    return _favorites;
  }

  void setFavorite(UserFavorites favorite) {
    _favorites = favorite;
    notifyListeners();
  }
}

//Products
class ProductProvider extends ChangeNotifier {
  Product? _selectedProduct;
  List<Product>? _products;

  List<Product>? getProducts() {
    return _products;
  }

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Product? getSelectedProduct() {
    return _selectedProduct;
  }

  void setSelectedProduct(Product selectedProduct) {
    _selectedProduct = selectedProduct;
    notifyListeners();
  }
}
