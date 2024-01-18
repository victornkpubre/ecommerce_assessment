import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/shared_preferences.dart';
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/controllers/user_controller.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppPreferences _appPreferences = AppPreferences();
  UserController _userController = UserController();

  void _logout() {
    _appPreferences.localUserLogout();
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> profileState() async {
    if (await _appPreferences.isUserLoggedIn()) {
      _userController.getUser(context);
    }
  }

  @override
  void initState() {
    profileState();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(builder: (context, provider, child) {
        return provider.getUser() == null
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Personal", style: subTitleStyle),
                      Text("Username: ${provider.getUser()!.username}"),
                      Text("Email: ${provider.getUser()!.email}"),
                      Text("Phone Number: ${provider.getUser()!.phone!}"),
                      SizedBox(height: 16),
                      Text("Favorites", style: subTitleStyle),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.getFavorite().favorites.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product =
                              provider.getFavorite().favorites[index];

                          return Container(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                    imageUrl: product.image,
                                    height:
                                        MediaQuery.of(context).size.height / 10),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        children: [
                                          Text(
                                            product.title,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                      Text(product.category),
                                      Text("\$${product.price}"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () async {
                            _logout();
                          },
                          child: Text('Logout',
                              style: TextStyle(color: warningColor)),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
