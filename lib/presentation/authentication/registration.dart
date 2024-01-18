import 'package:ecommerce/app/app_toast.dart';
import 'package:ecommerce/app/shared_preferences.dart';
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/controllers/products_controller.dart';
import 'package:ecommerce/domain/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AppPreferences _preferences = AppPreferences();
  final UserController _userController = UserController();
  final ProductsController _productsController = ProductsController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void _register() async {
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await _userController.createUser(context, username, email, password);

      showErrorToastbar("User Account Created", context);

      _userController.getUser(context);
      _productsController.getProducts(context);

      Navigator.pushReplacementNamed(context, '/products');
    } catch (e) {
      print(e);
    }
  }

  Future<void> authState() async {
    if (await _preferences.isUserLoggedIn()) {
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  @override
  void initState() {
    authState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(mediumSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text("eCommerce", style: titleStyle),
            ),
            const SizedBox(height: 25),

            //Email Address Input
            TextField(
              controller: _emailController,
              style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: textInputStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
              ),
            ),

            //Username Address Input
            TextField(
              controller: _usernameController,
              style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: textInputStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
              ),
            ),

            //Password Input
            TextField(
              obscureText: true,
              controller: _passwordController,
              style: TextStyle(color: primaryColor),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: textInputStyle,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () async {
                  _register();
                },
                child:
                    Text('Register', style: TextStyle(color: secondaryColor)),
              ),
            ),
            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Login', style: TextStyle(color: primaryColor)),
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
