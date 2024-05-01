import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/models/product_model.dart';

import '../../../core/widgets/product_card_d.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class WomenCategory extends StatefulWidget {
  static const String routeName = "women";
  const WomenCategory({super.key});

  @override
  State<WomenCategory> createState() => _WomenCategoryState();
}

class _WomenCategoryState extends State<WomenCategory> {
  List<Product> products = [];

  Future<List<Product>> getAllProducts() async {
    // get token from shared preferences

    var token = await SharedPreferences.getInstance().then((value) => value.getString('token'));
    var category_id = '4';
    final response = await http.get(Uri.parse('http://192.168.1.13:8000/api/get-product-by-categoryId/$category_id'), headers: {
      'Authorization': 'Bearer ' + token!,

    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
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
                FutureBuilder<List<Product>>(
                  future: getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: snapshot.data![index],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
