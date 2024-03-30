import 'package:flutter/material.dart';
import 'package:store/services/get_all_categories.dart';
import 'package:store/widgets/custom_category_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: AllCategoriesService().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> categoriesList = snapshot.data!;
          return Container(
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomCategoryCard(categoryName: categoriesList[0]),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCategoryCard(categoryName: categoriesList[1]),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCategoryCard(categoryName: categoriesList[2]),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCategoryCard(categoryName: categoriesList[3]),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
