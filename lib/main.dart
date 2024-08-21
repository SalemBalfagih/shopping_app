import 'package:flutter/material.dart';
import 'package:shopping_app/view/home_view.dart';
import 'package:shopping_app/view/update_product_view.dart';

void main(List<String> args) {
  runApp(const Shopping());
}

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          elevation: 10,
          shadowColor: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
        UpdateProductView.id: (context) => UpdateProductView()
      },
    );
  }
}
