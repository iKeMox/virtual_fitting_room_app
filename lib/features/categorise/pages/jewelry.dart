import 'package:flutter/material.dart';

class JewelryCategory extends StatefulWidget {
  static const String routeName = "jewelry";
  const JewelryCategory({super.key});

  @override
  State<JewelryCategory> createState() => _JewelryCategoryState();
}

class _JewelryCategoryState extends State<JewelryCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Jewelry Category'),
      ),
    );
  }
}
