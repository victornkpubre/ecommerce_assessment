import 'package:ecommerce/app/shared_preferences.dart';
import 'package:ecommerce/data/api_client.dart';
import 'package:ecommerce/data/dio.dart';
import 'package:ecommerce/domain/entities/user.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserController {
  final AppPreferences _preferences = AppPreferences();
  final ApiClient _appServiceClient = ApiClient(DioFactory().getDio());

  Future<dynamic> login(String username, String password) async {
    return await _appServiceClient.login(username, password);
  }

  Future<void> getUser(BuildContext context) async {
    var result = await _appServiceClient.getUser("5");
    User user = User.fromJson(result);
    _preferences.setUser(user);

    context.read<UserProvider>().setUser(user);
  }

  Future<dynamic> createUser(BuildContext context, username, email, password) async {
    var result = await _appServiceClient.createUser(
        username, email, password);
    return result;
  }

  Future<User?> updateUser(BuildContext context, id, username, email, password) async {
    var result = await _appServiceClient.updateUser(
        id, username, email, password);
    _preferences.setUser(result);
    context.read<UserProvider>().setUser(result);

    return result;
  }

  Future<void> setFavorites(BuildContext context, UserFavorites favorites) async {
    context.read<UserProvider>().setFavorite(favorites);
  }

  Future<void> getFavorites(BuildContext context, UserFavorites favorites) async {
    context.read<UserProvider>().setFavorite(favorites);
  }
}
