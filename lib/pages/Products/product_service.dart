import 'dart:convert';

class ProductService {
  String _mockData = '''
    {
      "success": true,
      "code": 200,
      "message": "Request: true",
      "productDTO": null,
      "productDTOList": [
        {
          "id": 1,
          "name": "Giày thể thao nam nữ Xvessel",
          "quantity": 200,
          "price": 310000.0,
          "description": null,
          "image": "https://res.cloudinary.com/df2lihowb/image/upload/v1683781402/Shoee/5ade52d8d53aa9f1a8850671d1c238ae_wy43px.jpg",
          "categoryId": 1
        },
        {
          "id": 2,
          "name": "Giày MLB LA",
          "quantity": 200,
          "price": 399000.0,
          "description": null,
          "image": "https://res.cloudinary.com/df2lihowb/image/upload/v1683781315/Shoee/vn-11134207-7qukw-lfrbncxo0e0n0d_y4xqdc.jpg",
          "categoryId": 2
        },
        {
          "id": 3,
          "name": "Giày MLB Chunky Liner",
          "quantity": 200,
          "price": 415000.0,
          "description": null,
          "image": "https://res.cloudinary.com/df2lihowb/image/upload/v1683781240/Shoee/e10153cc4bb22c69a148496f5cedacde_iwusxd.jpg",
          "categoryId": 2
        },
        {
          "id": 4,
          "name": "Giày MLB NY",
          "quantity": 200,
          "price": 415000.0,
          "description": null,
          "image": "https://res.cloudinary.com/df2lihowb/image/upload/v1683781187/Shoee/sg-11134201-22120-8m0uoozhzikv09_xr676g.jpg",
          "categoryId": 2
        },
        {
          "id": 5,
          "name": "Giày sneaker Yeezy350",
          "quantity": 200,
          "price": 650000.0,
          "description": null,
          "image": "https://res.cloudinary.com/df2lihowb/image/upload/v1683780976/Shoee/YEEZY_ahlkuw.jpg",
          "categoryId": 2
        }
      ],
      "productDTOPage": null
    }
  ''';

  Future<List<Product>> fetchProducts() async {
    // Delay để giả lập thời gian gọi API
    await Future.delayed(Duration(seconds: 2));

    final List<dynamic> productListJson =
        json.decode(_mockData)['productDTOList'];
    return productListJson.map((e) => Product.fromJson(e)).toList();
  }
}

class Product {
  final int id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String image;
  final int categoryId;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.image,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      description: json['description'] ?? '',
      image: json['image'],
      categoryId: json['categoryId'],
    );
  }
}
