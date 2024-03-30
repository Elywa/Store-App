import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/functions/functions.dart';
import 'package:store/services/add_product_service.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_form_field.dart';

class AddProductView extends StatefulWidget {
  AddProductView({Key? key}) : super(key: key);

  static String id = 'AddProductView';
  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  late String productName, desc, image, price, category;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffB7935F),
          centerTitle: true,
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  keyboradTpe: TextInputType.number,
                  hintText: 'price',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    category = data;
                  },
                  hintText: 'category',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'Add Product',
                  ontTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        AddProductService().addProductService(
                            title: productName,
                            price: price,
                            description: desc,
                            category: category,
                            image: image);

                        showSnackBar(context, 'Added Succefully');
                      } catch (ex) {
                        showSnackBar(context, ex.toString());
                      }

                      isLoading = false;
                      setState(() {});
                    }  else {
                      showSnackBar(context, 'oops! , try again later ');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
