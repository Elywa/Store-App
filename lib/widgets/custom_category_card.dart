import 'package:flutter/material.dart';
import 'package:store/views/category_name_product.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryNameProducts.id,
            arguments: categoryName);
      },
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 0,
            offset: const Offset(10, 10),
          ),
        ]),
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Center(
                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
