import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';

import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custome_text_field.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});
  static String id = 'UpdateProductView';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productName, description, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hint: 'Description',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hint: 'Price',
                  keyboradTpe: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hint: 'Image',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  ontTap: () async {
                    isLoading = true;
                    setState(() {});
                    await updateProductService(product);
                    try {
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductService(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      category: product.category,
      image: image == null ? product.image : image!,
    );
  }
}
