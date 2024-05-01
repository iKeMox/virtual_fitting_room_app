import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graduation_project_fitting_app/models/favorite_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class FavoritesCard extends StatefulWidget {
  final FavoriteProduct favoriteProduct;
  final Function onDelete; // Define a callback function

  const FavoritesCard({Key? key, required this.favoriteProduct, required this.onDelete}) : super(key: key);

  @override
  State<FavoritesCard> createState() => _FavoritesCardState();
}

class _FavoritesCardState extends State<FavoritesCard> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
                var token = await SharedPreferences.getInstance().then((value) => value.getString('token'));

                if (token == null) {
                  return;
                }
                var url = Uri.parse(
                    'http://192.168.1.13:8000/api/delete-favorite-products/${widget.favoriteProduct.product.id}');
                var response = await http.post(url, headers: {
                  "Authorization": "Bearer $token",
                });
                if (response.statusCode == 200) {
                  // Call the onDelete callback function
                  widget.onDelete(); // Notify the parent widget
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Product removed from favorites'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to remove product from favorites'),
                    ),
                  );
                }
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              icon: Icons.delete,
              label: 'Delete',
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
          width: mediaQuery.width,
          height: 120, // Fixed height for the card
          child: Row(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.favoriteProduct.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: mediaQuery.width - 170, // Adjusted width
                        child: Text(
                          widget.favoriteProduct.product.name,
                          style: theme.textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18), color: Colors.black),
                      child: TextButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text(
                          'Try it',
                          style: theme.textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

