import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/core/widgets/product_card.dart';
import 'package:graduation_project_fitting_app/features/categorise/pages/men_category.dart';
import 'package:graduation_project_fitting_app/features/categorise/pages/shoes_category.dart';
import 'package:graduation_project_fitting_app/features/home/widgets/categories_widget.dart';
import 'package:graduation_project_fitting_app/models/categories_model.dart';
import '../../categorise/pages/jewelry.dart';
import '../../categorise/pages/women_category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<CategoriesModel> categoriesList = [
      CategoriesModel(
          id: "men's clothing",
          title: 'Men',
          image: 'assets/images/men_cat.jpg',
          onClick: onCategoryClicked),
      CategoriesModel(
          id: "women's clothing",
          title: 'Women',
          image: 'assets/images/women_cat.jpg',
          onClick: onCategoryClicked),
      CategoriesModel(
          id: "electronics",
          title: 'Shoes',
          image: 'assets/images/shoes_cat.jpg',
          onClick: onCategoryClicked),
      CategoriesModel(
          id: "jewelery",
          title: 'Jewelry',
          image: 'assets/images/jewelry_cat.jpg',
          onClick: onCategoryClicked),
    ];
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 10, left: 10),
      child: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: mediaQuery.width,
                  height: 100,
                  child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Home",
                              style: theme.textTheme.titleLarge?.copyWith(fontSize: 28),
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
              // const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(

                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: CarouselSlider(
                      items: [
                        Image.asset(
                          "assets/images/banner1.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/banner2.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/banner3.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/banner4.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/banner5.jpg",
                          fit: BoxFit.contain,
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Categories",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              // NavigationBar(destinations: ),

              SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 110,
                      width: 410,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 6,
                          childAspectRatio: 1.2,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context, index) => CategoriesWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: 4,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text(
                    "Popular",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w200),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 870,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  CategoriesModel? selectCategory;

  void onCategoryClicked(CategoriesModel categoryModel) {
    if (categoryModel.title == "Men") Navigator.pushNamed(context, MenCategory.routeName);
    if (categoryModel.title == "Women") Navigator.pushNamed(context, WomenCategory.routeName);
    if (categoryModel.title == "Shoes") Navigator.pushNamed(context, ShoesCategory.routeName);
    if (categoryModel.title == "Jewelry") Navigator.pushNamed(context, JewelryCategory.routeName);

    setState(() {});
  }
}
