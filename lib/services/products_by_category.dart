import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/helper/api.dart';
import 'package:shopping_app/models/products_model.dart';

class ProductsByCategoryService {
  Future<List<ProductsModel>> getProductsByCategory(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");
    List<ProductsModel> productsList = [];
    for (var i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }
    return productsList;
  }
}
