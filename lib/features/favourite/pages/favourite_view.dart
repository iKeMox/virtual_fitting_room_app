import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/favourite/widgets/favorites_card.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
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
                            "Favourites",
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

                          },
                        ),
                      ),]
                ),
              ),
            ),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),
            const FavoritesCard(),

          ],
        ),
      ),
    );
  }
}
