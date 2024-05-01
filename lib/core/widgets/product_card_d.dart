import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/product_details/pages/product_details_view.dart';
import 'package:graduation_project_fitting_app/models/product_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isFavorite = product.isFavorite ?? false;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsView.routeName,
            arguments: product);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)),
              child: Image.network(
                product.image,
                height: 120,
                width: 157,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: SizedBox(
                height: 24,
                child: LikeButton(
                  onTap: (isLiked) async {
                    if (!isFavorite) {
                      var token = await SharedPreferences.getInstance()
                          .then((value) => value.getString('token'));
                      if (token != null) {
                        var url = Uri.parse(
                            'http://192.168.1.13:8000/api/add-favorite-products');
                        var response = await http.post(url, headers: {
                          "Authorization": "Bearer $token",
                        }, body: {
                          "product_id": product.id.toString(),
                        });
                        if (response.statusCode == 201) {
                          isFavorite = true;
                          return !isLiked;
                        }
                        isFavorite = false;
                        return !isLiked;
                      }
                    } else {
                      var token = await SharedPreferences.getInstance()
                          .then((value) => value.getString('token'));
                      if (token != null) {

                        var url = Uri.parse(
                            'http://192.168.1.13:8000/api/delete-favorite-products/${product.id}');

                        var response = await http.post(url, headers: {
                          "Authorization": "Bearer $token",
                        });

                        if (response.statusCode == 200) {
                          isFavorite = false;
                          return !isLiked;
                        }
                      }
                    }
                    return isLiked; // Return the initial value if none of the conditions are met
                  },
                  size: 23,
                  animationDuration: const Duration(milliseconds: 500),
                  likeBuilder: (isLiked) {
                    return Icon(
                      Iconsax.heart5,
                      size: 24,
                      color: isFavorite ? Colors.red : Colors.white,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 10),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
