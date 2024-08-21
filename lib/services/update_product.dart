import 'package:shopping_app/helper/api.dart';
import 'package:shopping_app/models/products_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String category,
      required String image}) async {
    print(id);
    Map<String, dynamic> data =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductsModel.fromJson(data);
  }
}
