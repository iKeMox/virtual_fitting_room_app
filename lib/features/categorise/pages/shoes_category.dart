import 'package:flutter/material.dart';

class ShoesCategory extends StatefulWidget {
  static const String routeName = "shoes";
  const ShoesCategory({super.key});

  @override
  State<ShoesCategory> createState() => _ShoesCategoryState();
}

class _ShoesCategoryState extends State<ShoesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Shoes Category'),
      ),
    );
  }
}
