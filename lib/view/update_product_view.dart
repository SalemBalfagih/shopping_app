import 'package:flutter/material.dart';
import 'package:shopping_app/models/products_model.dart';
import 'package:shopping_app/services/update_product.dart';
import 'package:shopping_app/widgets/custom_button.dart';
import 'package:shopping_app/widgets/custom_textform.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});
  static String id = "UpdateProductView";

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? name, description, image;
  String? price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel products =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
        centerTitle: true,
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    CustomTextField(
                      hintText: "name",
                      onChanged: (data) {
                        name = data;
                      },
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        description = data;
                      },
                      hintText: "description",
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      hintText: "price",
                      onChanged: (data) {
                        price = data;
                      },
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        image = data;
                      },
                      hintText: "image",
                    ),
                    CustomButton(
                      text: "update",
                      onTap: () async {
                        isloading = true;

                        setState(() {});
                        try {
                          await updateProduct(products);
                          print("success");
                        } catch (e) {
                          print(e);
                        }
                        isloading = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> updateProduct(ProductsModel products) async {
    await UpdateProductService().updateProduct(
        id: products.id,
        title: name == null ? products.title : name!,
        price: price == null ? products.price.toString() : price!,
        description: description == null ? products.title : description!,
        image: image == null ? products.title : image!,
        category: products.category);
  }
}
