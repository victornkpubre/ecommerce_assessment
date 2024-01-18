
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/controllers/products_controller.dart';
import 'package:ecommerce/presentation/products/tabs/all_tab.dart';
import 'package:ecommerce/presentation/products/tabs/electronics_tab.dart';
import 'package:ecommerce/presentation/products/tabs/jewelery_tab.dart';
import 'package:ecommerce/presentation/products/tabs/mens_tab.dart';
import 'package:ecommerce/presentation/products/tabs/womens_tab.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsController _productsController = ProductsController();


  @override
  void initState() {
    _productsController.getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("eCommerce", style: titleStyle),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: InkWell(
                child: Icon(Icons.person_outlined),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: const <Widget>[
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Electronics',
              ),
              Tab(
                text: 'Jewelery',
              ),
              Tab(
                text: 'Women',
              ),
              Tab(
                text: 'Mens',
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(mediumSpacing),
          child: const TabBarView(
            children: <Widget>[
              //Screen 1
              AllTab(),
                  
              //Screen 2
              ElectronicsTab(),
          
              //Screen 3
              JeweleryTab(),
          
              //Screen 4
              MensTab(),
                  
              //Screen 5
              WomensTab()
            ],
          )
        )
      ),
    );
  }
}