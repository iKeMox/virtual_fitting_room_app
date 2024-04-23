import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  static const String routeName = "product";
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Product View'),
      ),
    );
  }
}
