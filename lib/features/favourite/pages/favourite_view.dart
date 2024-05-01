import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/favourite/widgets/favorites_card.dart';
import 'package:graduation_project_fitting_app/models/favorite_model.dart'; // Ensure this import is correct
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  TextEditingController searchController = TextEditingController();
  List<FavoriteProduct> favoriteProducts = [];

  Future<List<FavoriteProduct>> getAllFavoriteProducts() async {
    var token =
    await SharedPreferences.getInstance().then((value) => value.getString('token'));
    final response = await http.get(Uri.parse('http://192.168.1.13:8000/api/favorite-products'),
        headers: {
          'Authorization': 'Bearer ' + token!,
        });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((item) => FavoriteProduct.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load favorite products');
    }
  }

  @override
  void initState() {
    super.initState();
    getAllFavoriteProducts().then((products) {
      setState(() {
        favoriteProducts = products;
      });
    });
  }

  // Callback function to handle deletion
  void onDelete() {
    // Reload favorite products after deletion
    getAllFavoriteProducts().then((products) {
      setState(() {
        favoriteProducts = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wardrobe",
                            style: theme.textTheme.titleLarge?.copyWith(fontSize: 26),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: AnimSearchBar(
                          width: 320,
                          color: Colors.grey.shade200,
                          textController: searchController,
                          onSuffixTap: () {
                            setState(() {
                              searchController.clear();
                            });
                          },
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.close_outlined),
                          onSubmitted: (String value) {
                            // Implement search functionality here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...favoriteProducts
                  .map((product) => FavoritesCard(
                favoriteProduct: product,
                onDelete: onDelete, // Pass the onDelete callback
              ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

