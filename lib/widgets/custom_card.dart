import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/models/product_model.dart';
import 'package:store/views/update_product_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductView.id, arguments: model);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    model.title.substring(0, 10),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${model.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 2,
            right: 3,
            child: IconButton(
              onPressed: () {
                if (!favourite.contains(model)) {
                  favourite.add(model);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added Succefully '),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Already Added Before'),
                    ),
                  );
                  return;
                }
                // favourite.add(model);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Added'),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )),
        Positioned(
          top: -50,
          right: 30,
          child: Image.network(
            model.image,
            height: 100,
            width: 100,
          ),
        ),
      ]),
    );
  }
}

List<ProductModel> favourite = [];
