import 'package:ecommerce/app/app_toast.dart';
import 'package:ecommerce/app/shared_preferences.dart';
import 'package:ecommerce/app/styles.dart';
import 'package:ecommerce/domain/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController _userController = UserController();
  final AppPreferences _preferences = AppPreferences();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    try {
      // var value = await _userController.login('mor_2314', '83r5^_');
      var value = await _userController.login(_usernameController.text.trim(), _passwordController.text.trim());
      bool valueString = value is String;
      print(value);

      if (valueString) {
        showErrorToastbar(value, context);
      } else {
        _userController.getUser(context);
        Navigator.pushReplacementNamed(context, '/products');
      }
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
                  _login();
                },
                child: Text('Login', style: TextStyle(color: secondaryColor)),
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
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Text('Register', style: TextStyle(color: primaryColor)),
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
