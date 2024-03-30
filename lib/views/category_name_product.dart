import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_category_name_products.dart';
import 'package:store/widgets/custom_card.dart';

class CategoryNameProducts extends StatelessWidget {
  CategoryNameProducts({super.key});
  static const String id = "CategoryNameProducts";

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB7935F),
        centerTitle: true,
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        child: FutureBuilder<List<ProductModel>>(
          future: GetCategoryProductsService()
              .getCategoryProducts(categoryName: categoryName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> categoryProductsList = snapshot.data!;
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemCount: categoryProductsList.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    model: categoryProductsList[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
