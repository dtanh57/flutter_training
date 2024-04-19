import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/pages/Products/product_service.dart';

class ProductsItemWidget extends StatelessWidget {
  final Product product;

  const ProductsItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat("#,##0", "vi_VN");
    final formattedPrice = currencyFormatter.format(product.price);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network(
          //   product.image,
          //   errorBuilder: (context, error, stackTrace) {
          //     // This function will be called when there's an error loading the image
          //     return Text('Error loading image');
          //   },
          //   width: double.infinity,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$formattedPrice đ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 12),
                        padding: EdgeInsets.all(10)),
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Xử lý sự kiện thêm vào giỏ hàng
                    },
                    label: Text('Thêm vào giỏ hàng'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
