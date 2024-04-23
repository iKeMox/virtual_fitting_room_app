import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/models/categories_model.dart';
import 'package:graduation_project_fitting_app/network/api_manager.dart';

import '../../../core/widgets/product_card.dart';

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
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Women Category"),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: mediaQuery.height,
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  height: mediaQuery.height,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    // scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return const ProductCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
