import 'package:flutter/material.dart';
import 'package:shopping_app/models/products_model.dart';
import 'package:shopping_app/view/update_product_view.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.product,
  });
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductView.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            child: Card(
              elevation: 10,
              shadowColor: Color.fromARGB(255, 135, 135, 135),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0, 7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r"$" "${product.price}"),
                        Icon(Icons.favorite),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            right: 10,
            child: Image.network(
              product.image,
              height: 90,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
