import 'package:flutter/material.dart';
import 'package:lesson_35/viewmodels/product_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final productViewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Home Screen",
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: FutureBuilder(
        future: productViewModel.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text("Mahsulotlar topilmadi!"),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final products = snapshot.data;

          return products == null || products.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    final product = products[index];
                    return Card(
                      child: ListTile(
                        title: Image.network(product.imageUrl),
                        subtitle: Text(product.title),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
