import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/models/categories_model.dart';
import 'package:graduation_project_fitting_app/network/api_manager.dart';

class WomenCategory extends StatefulWidget {
  static const String routeName = "women";
  final CategoriesModel? categoryModel;
  const WomenCategory({super.key, this.categoryModel});

  @override
  State<WomenCategory> createState() => _WomenCategoryState();
}

class _WomenCategoryState extends State<WomenCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Women Category'),
      ),
    );
  }
}
