import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;
  final bool isEven;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageURL,
      required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(13.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isEven
            ? const Color.fromRGBO(216, 240, 253, 1)
            : const Color.fromRGBO(245, 247, 249, 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            '\$ $price',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Center(
            child: Image.asset(
              imageURL,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
