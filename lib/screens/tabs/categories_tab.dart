import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick; //call back function
  CategoriesTab({required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Pick your category of interest",
                style: Theme.of(context).textTheme.bodyLarge),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(
                      model: categories[index],
                      index: index,
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
