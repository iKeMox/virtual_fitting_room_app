import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/product/pages/product_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:like_button/like_button.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductView.routeName);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 157,
                    child: Image.asset(
                      'assets/images/banner2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: SizedBox(
                height: 24,
                child: LikeButton(
                  size: 23,
                  animationDuration: const Duration(milliseconds: 500),
                  likeBuilder: (isLiked) {
                    if (isLiked) {
                      return const Icon(
                        Iconsax.heart5,
                        size: 24,
                        color: Colors.red,
                      );
                    }
                    if (!isLiked) {
                      return const Icon(
                        Iconsax.heart5,
                        size: 24,
                        color: Colors.white,
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Product Name',
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 16)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
