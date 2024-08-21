import 'package:http/http.dart' as http;
import 'package:shopping_app/helper/api.dart';
import 'package:shopping_app/models/products_model.dart';

class AddProductService {
  Future<ProductsModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String category,
      required String image}) async {
    Map<String, dynamic> data =
        await Api().post(url: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductsModel.fromJson(data);
  }
}
