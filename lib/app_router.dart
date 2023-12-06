import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/data_layer/repository/pizza_repository.dart';
import 'package:home_slice/data_layer/webservices/pizza_webservices.dart';
import 'package:home_slice/presentation_layer/screens/cart_screen.dart';
import 'package:home_slice/presentation_layer/screens/home_screen.dart';
import 'package:home_slice/presentation_layer/screens/pizza_order_screen.dart';
import 'package:home_slice/presentation_layer/screens/pizza_menu_screen.dart';
import 'package:home_slice/presentation_layer/widgets/navbar_widget.dart';

import 'business_logic_layer/cubit/pizza_api_cubit/pizza_cubit.dart';

class AppRouter {
  late PizzaRepository pizzaRepository;
  late PizzaCubit pizzaCubit;
  AppRouter() {
    pizzaRepository = PizzaRepository(PizzaWebServices());
    pizzaCubit = PizzaCubit(pizzaRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<FavoritePizzaCubit>(
                create: (context) => FavoritePizzaCubit()
                  ..createAndOpenFavoriteDatabase(), //when favoritepizzacubit is created, it creates and opens database
              ),
              BlocProvider<CartCubit>(
                create: (context) => CartCubit()..createAndOpenCartDatabase(),
              ),
              BlocProvider<PizzaOrderCubit>(
                create: (context) => PizzaOrderCubit(),
              )
            ],
            child: const NavBar(),
          ),
        );

      case '/home_screen':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/pizza_menu_screen':
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PizzaCubit>(
            create: (context) => PizzaCubit(pizzaRepository),
            child: PizzaMenuScreen(category: category),
          ),
        );

      case '/pizza_order_screen':
        // final argumentData = settings.arguments as Map<String, dynamic>;
        final pizzaModel = settings.arguments as PizzaModel;

        return MaterialPageRoute(
            builder: (context) => PizzaOrderScreen(
                  pizzaModel: pizzaModel,
                ));
      case '/cart_screen':
        return MaterialPageRoute(builder: (context) => const CartScreen());
    }
    return null;
  }
}
