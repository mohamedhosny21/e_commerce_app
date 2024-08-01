import 'package:flutter/material.dart';
import 'package:home_slice/generated/l10n.dart';

import 'package:home_slice/presentation_layer/cart/cart_screen.dart';
import 'package:home_slice/presentation_layer/favorite/favourite_screen.dart';
import 'package:home_slice/presentation_layer/home/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: S.of(context).Favorite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: S.of(context).Cart,
          ),
        ],
      ),
    );
  }
}
