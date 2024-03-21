import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
