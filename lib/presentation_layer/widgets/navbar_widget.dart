import 'package:flutter/material.dart';

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

  // List<Widget> _buildScreens() {
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
    //     context,
    //     screens: _buildScreens(),
    //     items: _navBarItems(),
    //     backgroundColor: MyColors.navyBlue,
    //     confineInSafeArea: true,
    //     controller: PersistentTabController(initialIndex: 0),
    //     hideNavigationBarWhenKeyboardShows: true,
    //     navBarStyle: NavBarStyle.style11,
    //     decoration: const NavBarDecoration(),
    //     handleAndroidBackButtonPress: true,
    //     // popAllScreensOnTapAnyTabs: true,
    //     resizeToAvoidBottomInset: true,
    //     stateManagement: true,
    //     bottomScreenMargin: 60,
    //     padding: const NavBarPadding.only(top: 10),
    //     navBarHeight: 60,
    //   );
    // }
  }
}
