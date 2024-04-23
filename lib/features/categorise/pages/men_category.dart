import 'package:flutter/material.dart';

import '../../../core/widgets/product_card.dart';


class MenCategory extends StatefulWidget {
  static const String routeName = "men";
  const MenCategory({super.key});

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
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
