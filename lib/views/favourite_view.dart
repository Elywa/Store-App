import 'package:flutter/material.dart';
import 'package:store/widgets/custom_card.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});
  static String id = 'FavouriteView';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 100,
        ),
        itemCount: favourite.length,
        itemBuilder: (context, index) {
          return CustomCard(
            model: favourite[index],
          );
        },
      ),
    );
  }
}
