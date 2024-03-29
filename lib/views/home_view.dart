import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  static String id = 'HomeView';
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> productsList = snapshot.data!;
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  model: productsList[index],
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
    );
  }
}
