import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/elements/app_bar_header.dart';
import 'package:namer_app/pages/Products/product_service.dart';
import 'package:namer_app/pages/Products/products_item.dart';
import 'package:namer_app/pages/UserDetails/user_details.dart';

class Products extends StatelessWidget {
  // Future<List<dynamic>> fetchUsers() async {
  //   String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load users');
  //   }
  // }

  final ProductService productService = ProductService();

  void onUserTap(BuildContext context, dynamic user) {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) {
          return UserDetails(user: user);
        },
      ),
    );
  }

  void deleteUser(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader(
        title: Text('Sản phẩm của chúng tôi'),
      ),
      body: RefreshIndicator(
        onRefresh:
            productService.fetchProducts, // Trigger fetchUsers() on refresh
        child: FutureBuilder<List<Product>>(
            future: productService.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              List<Product> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductsItemWidget(product: products[index]);
                },
              );
            }),
      ),
    );
  }
}
