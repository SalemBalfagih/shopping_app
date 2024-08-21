import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/models/products_model.dart';
import 'package:shopping_app/services/all_products_service.dart';
import 'package:shopping_app/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
          title: const Text(
            "Shopping",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<ProductsModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.only(left: 8, top: 45, right: 8),
                child: GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: products[index],
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
