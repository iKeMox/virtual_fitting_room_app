import 'package:flutter/material.dart';
import '../../../models/categories_model.dart';

typedef OnCategoryClicked = void Function(CategoriesModel)?;

class CategoriesWidget extends StatelessWidget {
  final int index;
  final CategoriesModel categoryModel;
  final OnCategoryClicked onCategoryClicked;

  CategoriesWidget({
    super.key,
    required this.index,
    required this.categoryModel,
    required this.onCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () {
        if (onCategoryClicked == null) return;
        onCategoryClicked!(categoryModel);

        // Navigator.pushNamed(context, CategoriseView.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                categoryModel.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(categoryModel.title,
                style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade700, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
