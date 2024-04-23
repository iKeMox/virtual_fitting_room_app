import 'package:flutter/material.dart';

import '../../../core/widgets/product_card.dart';

class JewelryCategory extends StatefulWidget {
  static const String routeName = "jewelry";
  const JewelryCategory({super.key});

  @override
  State<JewelryCategory> createState() => _JewelryCategoryState();
}

class _JewelryCategoryState extends State<JewelryCategory> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewelry Category"),
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
