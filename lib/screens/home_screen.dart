import 'package:flutter/material.dart';
import 'package:shop_app_flutter/screens/cart.dart';
import 'package:shop_app_flutter/screens/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavigationBarIndex = 0;

  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          // for storing state
          // pages[selectedNavigationBarIndex] do not store the state
          index: selectedNavigationBarIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedNavigationBarIndex = index;
            });
          },
          currentIndex: selectedNavigationBarIndex,
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
