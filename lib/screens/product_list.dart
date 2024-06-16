import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/screens/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final border = const OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
  );

  final List<String> filters = const [
    'All',
    'Addidas',
    'Apex',
    'Lotto',
    'Orion'
  ];

  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Shoes\nCollection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final filter = filters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Chip(
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: selectedFilter == filter
                        ? Theme.of(context).colorScheme.primary
                        : const Color.fromRGBO(245, 247, 249, 1),
                    side: const BorderSide(
                      color: Color.fromRGBO(245, 247, 249, 1),
                    ),
                    label: Text(filter.toString()),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraint) {
              log(constraint.maxHeight.toString());
              log(constraint.maxWidth.toString());
              log(constraint.minWidth.toString());
              log(constraint.minHeight.toString());
              if (constraint.maxWidth > 1080) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailScreen(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          imageURL: product['imageUrl'] as String,
                          isEven: index % 2 == 0,
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailScreen(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        imageURL: product['imageUrl'] as String,
                        isEven: index % 2 == 0,
                      ),
                    );
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
