
import 'package:ecommerce/domain/providers.dart';
import 'package:ecommerce/presentation/authentication/login.dart';
import 'package:ecommerce/presentation/authentication/registration.dart';
import 'package:ecommerce/presentation/products/product_details.dart';
import 'package:ecommerce/presentation/products/products.dart';
import 'package:ecommerce/presentation/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'eCommerce',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/' :(context) => const LoginPage(),
          '/register' :(context) => const RegisterPage(),
          '/products' :(context) => const ProductsPage(),
          '/productdetails' :(context) => const ProductDetailsPage(),
          '/profile' :(context) => const ProfilePage(),
        },
      ),
    );
  }
}

