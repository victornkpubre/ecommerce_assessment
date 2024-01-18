import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/entities/user.dart';
import 'package:ecommerce/domain/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite(Product product) {
    bool result =
        context.read<UserProvider>().getFavorite().favorites.any((element) => element.id == product.id) ;
    print(result);
    return result;
  }

  void toggleFavorite(Product product) {
    List<Product> favorites = context.read<UserProvider>().getFavorite().favorites;
    if (isFavorite(product)) {
      favorites.removeWhere((element) => element.id == product.id);
    } else {
      favorites.add(product);
    }

    print(favorites);

    context.read<UserProvider>().setFavorite(UserFavorites(favorites));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(builder: (context, provider, child) {
        return provider.getSelectedProduct() == null
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: provider.getSelectedProduct()!.image,
                        placeholder: (context, value) => Center(
                            child:
                                CircularProgressIndicator(color: primaryColor)),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        children: [
                          Text(provider.getSelectedProduct()!.title,
                              style: titleStyle),
                        ],
                      ),
                      Text("\$${provider.getSelectedProduct()!.price}"),
                      const SizedBox(height: 16),
                      Text("Description", style: subTitleStyle),
                      Text(provider.getSelectedProduct()!.description),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () async {},
                              child: Text('Add to Cart',
                                  style: TextStyle(color: secondaryColor)),
                            ),
                          ),
                          SizedBox(width: 8),

                          Consumer<UserProvider>(builder: (context, userprovider, child) {
                              return InkWell(
                                child: isFavorite(provider.getSelectedProduct()!)
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 32,
                                      )
                                    : const Icon(Icons.favorite_border_outlined,
                                        size: 32),
                                onTap: () {
                                  toggleFavorite(provider.getSelectedProduct()!);
                                },
                              );
                            }
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
