
import 'package:ecommerce/app/styles.dart';
import 'package:flutter/material.dart';

void showErrorToastbar(String error, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          error,
          style: TextStyle(color: secondaryColor, fontSize: 16),
        ),
      ],
    ),
    duration: const Duration(seconds: 5),
    backgroundColor: primaryColor,
  ));
}