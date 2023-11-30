import 'package:flutter/material.dart';
import 'package:home_slice/app_router.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/presentation_layer/screens/cart_screen.dart';
import 'package:home_slice/presentation_layer/screens/favourite_screen.dart';
import 'package:home_slice/presentation_layer/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  List<Widget> _buildScreens() {
    return [HomeScreen(), FavouriteScreen(), CartScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: AppRouter().generateRoute),
        icon: const Icon(Icons.home),
        activeColorPrimary: MyColors.myPink,
        inactiveColorPrimary: Colors.white,
        title: 'Home',
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: AppRouter().generateRoute),
        icon: const Icon(Icons.favorite),
        activeColorPrimary: MyColors.myPink,
        inactiveColorPrimary: Colors.white,
        title: 'Favourites',
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: AppRouter().generateRoute),
        icon: const Icon(Icons.shopping_cart),
        activeColorPrimary: MyColors.myPink,
        inactiveColorPrimary: Colors.white,
        title: 'Cart',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarItems(),
      backgroundColor: MyColors.myNavyBlue,
      confineInSafeArea: true,
      controller: PersistentTabController(initialIndex: 0),
      hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style11,
      decoration: const NavBarDecoration(),
      handleAndroidBackButtonPress: true,
      // popAllScreensOnTapAnyTabs: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      bottomScreenMargin: 60,
      padding: const NavBarPadding.only(top: 10),
      navBarHeight: 60,
    );
  }
}
