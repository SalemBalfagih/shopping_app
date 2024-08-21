import 'dart:developer';

import 'package:shopping_app/helper/api.dart';
import 'package:shopping_app/models/products_model.dart';

class AllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductsModel> productsList = [];
    for (var i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }

    return productsList;
  }
}
