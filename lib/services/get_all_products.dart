import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModle>> getAllProducts() async {
   
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');
     
      List<ProductModle> productsList = [];

      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModle.fromJson(data[i]),
        );
      }

      return productsList;
    
  }
}
